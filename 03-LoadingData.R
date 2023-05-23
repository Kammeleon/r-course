library("readr")
cats <- read.csv("data/feline-data.csv")

cats <- read_csv("data/feline-data.csv", col_types = cols(
  coat = col_character(),
  weight = col_double(),
  likes_string = col_logical()
))

file.show("data/feline-data_v2.csv")

cats2 <- read_csv("data/feline-data_v2.csv", col_types = cols(
  coat = col_character(),
  weight = col_character(),
  likes_string = col_logical()
))
cats$weight
cats[1:2,2:3]
cats[1,]
cats[,1]

#writing data in R
write_csv(cats, "data/mycats.csv")

#Categorical data:
catCoats <- cats$coat
validCoatColors <- c("white", "black", "calico", "tabby")
coatFactor <- parse_factor(catCoats, levels = validCoatColors)
coatFactor
