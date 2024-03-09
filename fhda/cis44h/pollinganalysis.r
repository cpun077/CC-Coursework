# Caden Pun 3/8/24
library(tidyverse)
library(dotenv)
load_dot_env()
polls <- read.csv("http://projects.fivethirtyeight.com/general-model/president_general_polls_2016.csv")

# %>% pipe operator forwards expression into next function
# item count for each column
apply(X = polls, MARGIN = 2, FUN = unique) %>% lapply(FUN = length) %>% str()

# view value counts for each type column
table(polls$type)

# compare type column with poll data columns
polls %>%
select(type, state, enddate, rawpoll_clinton, adjpoll_clinton) %>%
arrange(state, enddate, type)

# unique values for state column
unique(polls$state)

# adults, likely voters, registered voters, and voters
# barplot population column
ggplot(polls, aes(x = population, fill = population)) + geom_bar()

# scatterplot to compare poll weight, sample size, and grade columns
ggplot(polls, aes(x = poll_wt, y = samplesize, color = grade)) + 
geom_point(size = 3)

# narrow down columns
polls <- polls %>% 
select(type, state, enddate, population, rawpoll_clinton, rawpoll_trump)
# rename the columns
polls <- polls %>% 
rename(
    Type = type, State = state, 
    EndDate = enddate,
    Population = population,
    Clinton = rawpoll_clinton, 
    Trump = rawpoll_trump
)
# sort the rows
polls <- polls %>% arrange(State, EndDate)

# narrow down to only now-cast type, drop type column
polls <- polls %>%
filter(Type == "now-cast") %>%
select(-Type)
# filter for only lv or rv
polls <- polls %>% filter(Population %in% c("lv", "rv"))
# remove congressional district rows
polls <- polls %>% filter(!str_detect(State, "CD-"))
# check number of states
length(unique(polls$State))
# rename population column and values
polls <- polls %>%
mutate(Population = str_replace(Population,"lv", "Likely"),
Population = str_replace(Population, "rv", "Registered")) %>%
rename(VoterType = Population)
# convert enddate column to Date type
polls <- polls %>% mutate(EndDate = as.Date(EndDate, format="%m/%d/%Y"))
# save cleaned data
dir <- Sys.getenv("REPO_DIR")
dir <- paste0(dir, "/fhda/cis44h/resources/pollelection16_cleaned.rds")
saveRDS(polls, file = dir)