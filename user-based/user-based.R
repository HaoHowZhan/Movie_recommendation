library(data.table)
library(magrittr)
library(bigmemory)
library(bigalgebra)

ratings <- fread("D:/文件/学校文件/MATH 571/Project/ml-20m/ratings.csv", header = TRUE)

ratings[, unique(userId)] %>%
  length %>%
  paste0("number of users: ", .) %>%
  print
ratings[, unique(movieId)] %>%
  length %>%
  paste0("number of movies: ", .) %>%
  print

ratings[, timestamp := NULL]

target.users <- ratings[, unique(userId)] %>%
  sample(size = 1e4)

ratings.target <- ratings[userId %in% target.users]

ratings.m <- dcast(ratings.target, userId ~ movieId, value.var = "rating", fill = 0)
m <- as.big.matrix(ratings.m[, -1])

mm <- tcrossprod(m, m)
