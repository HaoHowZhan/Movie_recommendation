#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Tag-based Recommandation System"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         numericInput("id",
                     "movieId:",
                     min = 1,
                     max = 131262,
                     value = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        h3("Input info"),
        tableOutput("input"),
        h3("Top tags"),
        tableOutput("tags"),
        h3("Recommandations"),
        tableOutput("table")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  score <- read.csv('D:/Temp/ml-20m/genome-scores.csv', sep=',')
  movies <- read.csv('D:/Temp/ml-20m/movies.csv', sep=',')
  tag <- read.csv('D:/Temp/ml-20m/genome-tags.csv', sep=',')
  find_tags <- function(movie_number){
    target = score[score["movieId"] == movie_number, ]
    top_tags = target[order(target$relevance, decreasing = TRUE), "tagId"][1:10]
    print(tag[top_tags, ])
    return(top_tags)
  }
  find_recommendations <- function(tags, n){
    possi = score[score[, "tagId"] %in% tags, ]
    possi_rele = tapply(possi$relevance, possi$movieId, mean)
    possi_id <- as.numeric(names(sort(possi_rele, decreasing = T)[2:(n+1)]))
    return(movies[movies[, "movieId"] %in% (possi_id), ])
  }
   
  output$table <- renderTable({
    tags <- find_tags(input$id)
    find_recommendations(tags, 10)
  })
  output$input <- renderTable({
    movies[input$id, ]
  })
  output$tags <- renderTable({
    tags <- find_tags(input$id)
    tag[tags, ]
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

