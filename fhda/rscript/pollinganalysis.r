# Caden Pun 3/8/24
library(tidyverse)
library(dotenv)


# SETUP


# include path to env as param for rstudio
load_dot_env()
parentdir <- Sys.getenv("REPO_DIR")
polls <- read.csv("http://projects.fivethirtyeight.com/general-model/president_general_polls_2016.csv")


# INITIAL OBSERVATIONS


# item count for each column
# %>% pipe operator forwards expression into next function
apply(X = polls, MARGIN = 2, FUN = unique) %>% lapply(FUN = length) %>% str()
# view value counts for each type column
table(polls$type)
# compare type column with poll data columns
polls %>%
select(type, state, enddate, rawpoll_clinton, adjpoll_clinton) %>%
arrange(state, enddate, type)
# unique values for state column
unique(polls$state)
# barplot population column
# adults, likely voters, registered voters, and voters
ggplot(polls, aes(x = population, fill = population)) + geom_bar()
# scatterplot to compare poll weight, sample size, and grade columns
ggplot(polls, aes(x = poll_wt, y = samplesize, color = grade)) + 
geom_point(size = 3)


# CLEANING DATA


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
dir <- paste0(parentdir, "/fhda/cis44h/resources/pollelection16_cleaned.rds")
saveRDS(polls, file = dir)


# PREPARING NATIONAL POLL DATA


# create 2 gap columns
polls <- polls %>% mutate(Gap = Clinton - Trump)
polls <- polls %>% group_by(State) %>%
mutate(StateGap = mean(Gap)) %>%
ungroup()
# swing state column
polls <- polls %>% mutate(
Swing = ifelse(State != "U.S." & (abs(StateGap) < 7),
TRUE, FALSE))
# drop stategap column
polls <- select(polls, -StateGap)
# enlongate data
polls <- pivot_longer(polls, cols = c("Clinton", "Trump"),
names_to = "Candidate", values_to = "Percent")
# save prepared data
dir <- paste0(parentdir, "/fhda/cis44h/resources/pollelection16_prepared.rds")
saveRDS(polls, file = dir)


# PLOTS


# line plot
ggplot(filter(polls, State == "U.S."),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_line() +
scale_color_manual(values = c("blue", "red")) +
labs(title = "Polls for the U.S.", x = "Date", y = "") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom")
# scatterplot with smooth line
ggplot(filter(polls, State == "U.S."),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_point() +
geom_smooth(se = FALSE, size = 2) +
scale_color_manual(values = c("blue", "red")) +
labs(title = "Polls for the U.S.", x = "Date", y = "") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom")
# smooth line
ggplot(filter(polls, State == "U.S."),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_smooth(se = FALSE) +
scale_color_manual(values = c("blue", "red")) +
labs(title = "Polls for the U.S.", x = "Date", y = "") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom")
# swing states smooth line
ggplot(polls %>% filter(Swing == TRUE),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_smooth(se = FALSE) +
scale_color_manual(values = c("blue", "red")) +
labs(title = "Polls for the Swing States", x = "Date", y = "") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom")
# lv in swing states 3 months prior to election
ggplot(polls %>% filter(Swing == TRUE &
VoterType == "Likely" &
EndDate > "2016-08-01"),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_smooth(se = FALSE) +
scale_color_manual(values = c("blue", "red")) +
labs(title = "Likely voters in Swing States", x = "Date", y = "") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom")
# comparing 2 swing states
states <- c("Arizona","Wisconsin")
ggplot(polls %>% filter(State %in% states & EndDate > "2016-08-01"),
aes(x = EndDate, y = Percent, color = Candidate)) +
geom_smooth(se = FALSE) +
scale_color_manual(values = c("blue", "red")) +
facet_grid(vars(State)) +
theme(legend.position = "bottom")
# gap data of selected states
start_date <- as.Date("2016-09-01")
states <- c("Florida","Michigan","Ohio")
ggplot(polls %>% filter(State %in% states & EndDate > start_date),
aes(x = EndDate, y = Gap)) +
geom_point() +
geom_smooth(se = FALSE) +
geom_hline(yintercept = 0, size = 1) +
facet_grid(vars(State))


# SUMMARY


# summarize by voter type and candidate
voter_types <- polls %>%
filter(Swing == TRUE) %>%
group_by(VoterType, Candidate) %>%
summarize(MeanPercent = mean(Percent), SD = sd(Percent))
print(voter_types)
# summarized plot
ggplot(voter_types,
aes(x = Candidate, y = MeanPercent, fill = VoterType)) +
geom_col(position = "dodge") +
geom_errorbar(aes(ymin = MeanPercent - SD, ymax = MeanPercent + SD),
width = 0.1, position = position_dodge(0.9)) +
labs(y = "", x = "")


# LAST WEEK OF ELECTION


# mean gap of swing states in last week
states <- c("Arizona","Florida","Iowa","Nevada","North Carolina",
"Ohio","Pennsylvania","Wisconsin")
polls_nov <- polls %>%
filter(State %in% states & EndDate > as.Date("2016-11-01")) %>%
group_by(State) %>%
summarize(MeanStateGap = mean(Gap))
# add advantage column and make gap absolute value
polls_nov <- polls_nov %>% mutate(
Advantage = ifelse(MeanStateGap >= 0, "Clinton","Trump"),
MeanStateGap = abs(round(MeanStateGap, 3)))
# last week of election plot
ggplot(polls_nov) +
geom_col(aes(x = State, y = MeanStateGap, fill = Advantage)) +
scale_fill_manual(labels = c("Clinton","Trump"),
values = c("blue","red")) +
labs(title = "Results for Final Week of Election",
x = "", y = "Mean Percent") +
theme(plot.title = element_text(hjust = 0.5))


# WEEKLY GAP OF SWING STATES


# select rows and columns of weekly gaps of swing states
polls_weekly <- polls %>% filter(Swing == TRUE) %>%
select(State, EndDate, Gap) %>%
unique()
# function to put each date in a weekly bin
get_next_sunday <- function(row) {
    date <- as.Date(row[2])
    day_of_week <- as.integer(format(date, "%w"))
    next_sunday <- ""
    if(day_of_week == 0) {
    next_sunday <- date
    } else {
    next_sunday <- date + (7 - day_of_week)
    }
    return(next_sunday)
}
# add column to hold date bins
polls_weekly <- polls_weekly %>%
mutate(
    Week = apply(polls_weekly, MARGIN = 1, FUN = get_next_sunday),
    Week = as.Date(Week, origin = "1970-01-01")
)
# mean poll for each date bin
polls_weekly <- polls_weekly %>%
filter(Week > as.Date("2016-09-01")) %>%
group_by(State, Week) %>%
summarize(MeanGap = mean(Gap)) %>%
ungroup()
# add advantage column and make gap absolute value
polls_weekly <- polls_weekly %>%
mutate(Advantage = ifelse(MeanGap >= 0, "Clinton", "Trump"),
MeanGap = abs(round(MeanGap, 1)))
# weekly gap data of swing states plot
ggplot(polls_weekly, aes(x = Week, y = State)) +
geom_tile(aes(fill = Advantage, color = "", alpha = MeanGap)) +
geom_text(aes(label = MeanGap, color = "")) +
scale_fill_manual(values = c("blue","red")) +
scale_color_manual(values = "white", guide = "none") +
labs(title = "Weekly Gap for the Swing States") +
theme(plot.title = element_text(hjust = 0.5),
legend.position = "bottom") +
scale_alpha(range = c(0.25,0.95)) +
guides(alpha = "none")