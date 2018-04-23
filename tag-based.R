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
