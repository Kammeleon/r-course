monthlyData <- read_csv("data/monthlyBae.csv",
                        col_types = 
                          cols( 
                            word = col_character(),
                            monthyear = col_date(),
                            stateCode = col_character(),
                            Region = col_character(),
                            cases = col_integer(),
                            totalTokens = col_integer(),
                            tokenProp = col_double()
                            ))

monthlyData

ggplot(monthlyData, aes(x = monthyear, y = cases)) +
  geom_point()

##combining dplyr and ggplot2:

monthlyData %>% 
  ggplot(aes(x = monthyear, y = cases)) +
  geom_point()


monthlyData %>% 
  filter(Region == "West") %>% 
  ggplot(aes(x = monthyear, y = cases)) +
  geom_point()

##Challenge 1 - modify to show tokenprop instead of cases:

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp)) +
  geom_point()

##add color according to region

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp, color = Region)) +
  geom_point()

##joining the dots:
monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp, color = Region)) +
  geom_line()

##group by state:

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             color = Region, Group = stateCode)) +
  geom_line()

##Layers and aesthetics:

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             color = Region, Group = stateCode)) +
  geom_line() +
  geom_point()

##defining colors by different geom elements:
monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             Group = stateCode)) +
  geom_line(aes(color = Region)) +
  geom_point()

##red dots
monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             Group = stateCode)) +
  geom_line(aes(color = Region)) +
  geom_point(color = "red")

##understanding layering - putting lines over dots

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             Group = stateCode)) +
  geom_point(color = "red") +
  geom_line(aes(color = Region)) 

##multipanel figures

monthlyData %>% 
  ggplot(aes(x = monthyear, y = tokenProp,
             group = stateCode)) +
  geom_point() +
  geom_line() +
  facet_wrap("Region")

##more on faceting
monthlyDataAll <- read_csv("data/monthlyAll.csv",
                           col_types = 
                             cols(
                               word = col_character(),
                               monthyear = col_date(format = ""),
                               stateCode = col_character(),
                               Region = col_character(),
                               cases = col_integer(),
                               totalTokens = col_integer(),
                               tokenProp = col_double()
                             ))

monthlyDataAll %>%
  ggplot(aes(x = monthyear, y = tokenProp,
             group = stateCode)) +
  geom_point() + 
  geom_line() +
  facet_grid(word ~ Region, scale = "free_y")

##Challenge 3:

monthlyData %>% 
  ggplot(aes(x = monthyear, y = totalTokens, color = Region, group = stateCode)) +
  geom_line() +
  facet_wrap("Region", scales = "free_y")

##aside - interactively exploring graphs with  showing labels

monthlyData %>% 
  ggplot(aes(x = monthyear, y = totalTokens, group = stateCode, label = stateCode)) +
  geom_line() +
  geom_text() +
  facet_wrap("Region")

##transformations

monthlyData %>% 
  ggplot(aes(x = monthyear, y = totalTokens, colour = Region, group = stateCode)) +
  geom_line()

##y scale logartihmic

monthlyData %>% 
  ggplot(aes(x = monthyear, y = totalTokens, colour = Region, group = stateCode)) +
  geom_line() + scale_y_log10()

##final challenge:
##load twitter data

twitterData <- read_csv("data/twitterData.csv") 

##filter for word anime

twitterData %>% 
  filter(word == "anime") %>% 
  filter(stateCode %in% c("CA", "OR", "NV", "FL")) %>% 
  ggplot(aes(x = date, 
             y = cases, 
             color = stateCode)) +
  geom_line()


##modifying text on graph

twitterData %>% 
  filter(word == "anime") %>% 
  filter(stateCode %in% c("CA", "FL", "OR", "NV")) %>% 
  ggplot(aes(x = date, 
             y = cases,  
             colour = stateCode)) + 
  geom_line() + 
  labs(
    x = "Date", # x axis title
    y = "Number of times tweeted",   # y axis title
    title = "Use of 'anime' in various states",      # main title of figure
    colour = "State"      # title of legend
  ) 


##saving plots

ggsave("results/animePlot.png")
# Can also set the size and type of plot
ggsave("results/animePlot.pdf", width = 20, height = 20, units = "cm")
