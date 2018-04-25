
library(shiny)

shinyServer(function(input, output) {
   
  library(data.table)
  score <- fread('D:/Temp/ml-20m/genome-scores.csv', sep=',')
  movies <- fread('D:/Temp/ml-20m/movies.csv', sep=',')
  tag <- fread('D:/Temp/ml-20m/genome-tags.csv', sep=',')
  find_tags <- function(movie_number){
    setkey(score, movieId)
    target <- score[movieId == movie_number]
    top_tags <- target[order(relevance, decreasing = TRUE)[1:10], tagId]
    print(tag[tagId %in% top_tags])
    return(list(top_tags = top_tags, origin_number = movie_number))
  }
  find_recommendations <- function(tags, n){
    possi = score[tagId %in% tags$top_tags]
    possi_rele = possi[, .(rele_mean = mean(relevance)), by = movieId]
    possi_id <- possi_rele[order(rele_mean, decreasing = TRUE)[1:(n+1)], movieId]
    possi_id_minus_origin <- setdiff(possi_id, tags$origin_number)[1:n]
    return(movies[movieId %in% possi_id_minus_origin, ])
  }
  get_tt <- function(movie_id) {
    return(links[movieId == movie_id, imdbId])
  }
  get_poster <- function(movie_id) {
    tt <- get_tt(movie_id)
    if(nchar(tt) == 6) {
      tt <- paste0("0", tt)
    }
    src <- paste0("http://img.omdbapi.com/?i=tt", tt, "&h=600&apikey=7ae362a2")
    return(c('<img src="',src,'" height = "200">'))
  }
  
  output$table <- renderTable({
    tags <- find_tags(input$id)
    find_recommendations(tags, input$number)
  })
  output$input <- renderTable({
    movies[movieId == input$id, ]
  })
  output$tags <- renderTable({
    tags <- find_tags(input$id)
    tag[tagId %in% tags$top_tags, tag]
  })
  output$input_movie <- renderText({
    return(get_poster(input$id))
  })
  
})
