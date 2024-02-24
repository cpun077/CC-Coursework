# Caden Pun 2/24/24

cToF <- function(c) {
    return(c * 9 / 5 +32)
}

formatData <- function(min, max, interval) {
    c <- min
    # data frame allows built-in column headers
    result <- data.frame(Celcius = numeric(), Farenheit = numeric())
    while (c <= max) {
        c <- c + interval
        result <- rbind(result, data.frame(Celcius = c, Farenheit = cToF(c)))
    }
    return(round(result, digits = 2))
}

print(formatData(0, 100, 100/7))