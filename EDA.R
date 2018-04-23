library(data.table)
library(magrittr)

ratings <- fread("D:/文件/学校文件/MATH 571/Project/ml-20m/ratings.csv", header = TRUE)
movies <- fread("D:/文件/学校文件/MATH 571/Project/ml-20m/movies.csv", header = TRUE)
ratings[, unique(userId)] %>%
  length %>%
  paste0("number of users: ", .) %>%
  print
ratings[, unique(movieId)] %>%
  length %>%
  paste0("number of movies: ", .) %>%
  print

ratings[, timestamp := NULL]

movie.name.top10 <- ratings[, length(rating), movieId][order(-V1)]$movieId[1:10]
sapply(movie.name.top10, function(x) movies[movieId %in% x]) %>%
  t %>%
  as.data.frame
