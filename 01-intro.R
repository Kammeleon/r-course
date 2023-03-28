sentence <- "the cat sat on the hat"



mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age -20
mass > age

toupper("Hello, world")
toupper(sentence)

1:5
-3:3
5:1
(1:5)*2
2^(1:5)
x <- 5:10
c(2, 4, -1)
c(x, 2, 2, 3)
c("a", "b", "c", "def")
length(x)
length(letters)

month.name[2]
month.name[2:4]
month.name[c(2,3,4)]
month.name[4:2]

#challenge 4
letters[26:1]

#missing data
month.name[10:13]

#skipping and removing elements
month.name[-2]
month.name[c(-1, -5)]

#subsetting with logical vectors
fourmonths <- month.name[1:4]
fourmonths[c(TRUE, FALSE, TRUE, TRUE)]
fourmonths[c(TRUE, FALSE)]
fourmonths[c(TRUE, FALSE, TRUE, FALSE)]

my_vector <- c(0.01, 0.69, 0.51, 0.39)
my_vector > 0.5
my_vector[my_vector > 0.5]

#challenge 5
x <- c(5.4, 6.2, 7.1, 7.5, 4.8)
x[x > 6.1]
x[2:4]
x[c(FALSE, TRUE, TRUE, TRUE, FALSE)]
