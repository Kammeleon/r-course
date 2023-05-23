library("tidyverse")
library("lubridate")
library("dplyr")
TwitterData <- read_csv("./data/twitterData.csv",
                        col_types = cols(
                          date =col_date(),
                          stateCode = col_character(),
                          word = col_character(),
                          cases = col_double(),
                          dataDay = col_double(),
                          Region = col_character(),
                          totalTokens = col_double(),
                          State = col_character()
                        ))


##using select

dateWordState <- select(TwitterData, date, word, stateCode)
print(dateWordState)

##Using filter

twitterDataNE <- filter(TwitterData, Region == "Northeast")
print(twitterDataNE)

TwitterData %>%
  filter(cases >= 1)

TwitterData %>%
  filter(date >= 01012014)

dmy(01012014)
dmy("1 Jan 2014")
dmy("1/1/2014")

##Using pipes

TwitterData %>%
  filter(date >= dmy("1 Jan 2014"))

dateWordState<- TwitterData %>% 
  select(date, word, stateCode)
print(dateWordState)

NorthEastData <- TwitterData %>% 
  filter(Region == "Northeast") %>% 
  select(date, word, stateCode)
print(NorthEastData)

TwitterData %>% 
  filter(stateCode %in% c("WY", "UT", "CO", "AZ", "NM"))

##Challenge 1
##Produce a single command, that will produce a tibble that has the values of cases, stateCode and dataDay, for the countries in the south, but not for other regions.

SouthBae <- TwitterData %>% 
  filter(Region == "South") %>% 
  filter(word == "bae") %>% 
  select(cases, stateCode, dataDay)
nrow(SouthBae)

##Sorting tibbles

TwitterData %>% 
  filter(word == "anime") %>% 
  arrange(cases)

TwitterData %>% 
  filter(word == "anime") %>% 
  arrange(desc(cases))

TwitterData %>% 
  mutate(wordProp = cases / totalTokens)

##Challenge 2
## how often is the word Anime occuring over timein the stat of New York?

TwitterData %>% 
  filter(State == "New York") %>% 
  filter(word == "anime") %>% 
  select(date, cases) %>% 
  arrange(date) %>% 
  mutate(AnimeCount = cumsum(cases))

##Calculating summary statistics
TwitterData %>% 
  filter(word =="anime") %>% 
  summarise(totalAnime =sum(cases))

##ignoring NA values:
TwitterData %>% 
  filter(word == "anime") %>% 
  summarise(totalAnime =sum(cases, na.rm = TRUE))

##summaries for each variable:
TwitterData %>% 
  group_by(word) %>% 
  summarise(total = sum(cases, na.rm = TRUE))

##Challenge 3 calculate the number of times each word occured for each day in january
TwitterData %>% 
  filter(date >= dmy("1 Jan 2014")) %>% 
  filter(date < dmy("1 Feb 2014")) %>% 
  group_by(date, word) %>% 
  summarise(totalUse = sum(cases))

##Count() and n()
TwitterData %>% 
  group_by(word) %>%
  summarise(numObs = n())

TwitterData %>% 
  count(word)

##Connect mutate with logical filtering: ifelse()
TwitterData %>% 
  select(date, stateCode, word, cases) %>% 
  mutate(logcases =ifelse(cases > 0, log(cases), NA))
