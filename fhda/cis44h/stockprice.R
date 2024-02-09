# math - abs(), sign(), ceiling/floor(), exp/log/log2/log10()
# statistics - for cumulative add cum(min/max()), sum/prod/diff(), mean/median/mode()
# matrices - t() transpose, %*% multiply, det() determinant, solve() inverse

# read the apple stock csv and allow the slash in the header
setwd("C:/users/irons/documents/github/cs-coursework/fhda")
data <- read.csv(file = "cis44h/AAPL_2021.csv", check.names = FALSE)

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

# add volume bar plot
par(new = TRUE)
barplot(
    volume,  
    space = 0, 
    col = rgb(1, 0, 0, alpha = 0),
    border = rgb(1, 0, 0),
    yaxt = "n",
    ylim = c(0, max(volume)),
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
print(paste("Mean and Median Closing Price are", mean(prices), "and", median(prices), "respectively"))

# total volume of shares traded in 2021
print(paste("Total Volume of Shares traded in 2021 is", sum(volume)))