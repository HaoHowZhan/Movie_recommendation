
library(shiny)

shinyUI(fluidPage(
  titlePanel("Tag-based Recommandation System"),
  sidebarLayout(
    sidebarPanel(
      numericInput("id",
                   "movieId:",
                   min = 1,
                   max = 131262,
                   value = 1),
      numericInput("number",
                   "recommandation number:",
                   min = 1,
                   max = 50,
                   value = 10)
    ),
    mainPanel(
      h3("Input info"),
      tableOutput("input"),
      htmlOutput("input_movie"),
      h3("Top tags"),
      tableOutput("tags"),
      h3("Recommandations"),
      tableOutput("table")
    )
  )
)
)
