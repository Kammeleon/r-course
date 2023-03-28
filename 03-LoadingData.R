library("readr")
cats <- read.csv("data/feline-data.csv")

cats <- read_csv("data/feline-data.csv", col_types = cols(
  coat = col_character(),
  weight = col_double(),
  likes_string = col_logical()
))
cols()

cats2 <- read_csv("data/feline-data.csv")
cols()
