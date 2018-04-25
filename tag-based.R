library(data.table)
score <- fread('D:/Temp/ml-20m/genome-scores.csv', sep=',')
movies <- fread('D:/Temp/ml-20m/movies.csv', sep=',')
tag <- fread('D:/Temp/ml-20m/genome-tags.csv', sep=',')
links <- fread('D:/Temp/ml-20m/links.csv', sep=',')
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
  return(movies[movieId %in% possi_id_minus_origin , ])
}
get_tt <- function(movie_id) {
  return(links[movieId == movie_id, imdbId])
}
find_recommendations(find_tags(571), 10)
