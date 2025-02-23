# Author - Caden Pun

# read the apple stock csv and allow the slash in the header
library(dotenv)
load_dot_env()
dir <- Sys.getenv("REPO_DIR")
setwd(dir)
data <- read.csv(file = "fhda/cis44h/resources/AAPL_2021.csv", check.names = FALSE)

# get the data in chronological order
prices <- rev(as.numeric(gsub("\\$", "", data[, 2])))
days <- rev(as.Date(data[, 1], format = "%m/%d/%Y"))
volume <- rev(as.numeric(data[, 3]))

# change margins of graph
par(mar = c(10, 10, 10, 10))

# plot the line plot of prices vs days
plot(
    prices, 
    type = "l", 
    xlab = "Days Recorded (2021)", 
    ylab = "Closing Price ($)", 
    xaxt = "n", 
    col = rgb(0, 0, 1)
    )

# add x axis with m/d format
axis(
    side = 1, 
    at = seq_along(days), 
    labels = format(days, "%m/%d"), 
    cex.axis = 0.7
    )

# calculate midpoints of bars in volume bar plot
bp <- barplot(
    volume,  
    space = 0, 
    plot = FALSE
    )
# plot the volume bar plot with midpoints centered
par(new = TRUE)
barplot(
    volume,  
    space = 0, 
    col = rgb(1, 0, 0, alpha = 0),
    border = rgb(1, 0, 0),
    yaxt = "n",
    ylim = c(0, max(volume)),
    xlim = c(diff(bp)[1] / 2, 33 - diff(bp)[1] / 2)
    )

# add secondary y axis
ticks <- pretty(volume)
axis(
    side = 4, 
    at = ticks,  
    labels = ticks,
    cex.axis = 0.7,
    las = 1
    )
mtext("Volume", side = 4, line = 4.5)

# mean/median of closing price
print(paste("Mean (Average) and Median Closing Price are", mean(prices), "and", median(prices), "respectively"))

# mean/median of volume of shares traded
print(paste("Mean (Average) and Median Volume of Shares traded are", mean(volume), "and", median(volume), "respectively"))

# total volume of shares traded
print(paste("Total Volume of Shares traded in 2021 is", sum(volume)))