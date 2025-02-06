# Caden Pun 3/7/24

cis64Max <- function(v) {
    max <- -Inf
    for (num in v) {
        if (!is.numeric(num) || is.na(num)) return('NA')
        if (num > max) max <- num
    }
    return(max)
}

cis64Min <- function(v) {
    min <- Inf
    for (num in v) {
        if (!is.numeric(num) || is.na(num)) return('NA')
        if (num < min) min <- num
    }
    return(min)
}

cis64Sum <- function(v) {
    sum <- 0
    for (num in v) {
        if (!is.numeric(num) || is.na(num)) return('NA')
        sum <- sum + num
    }
    return(sum)
}

cis64Prod <- function(v) {
    prod <- 1
    for (num in v) {
        if (!is.numeric(num) || is.na(num)) return('NA')
        prod <- prod * num
    }
    return(prod)
}

displayResults <- function(v) {
    print("**************************")
    print(paste("Original Vector:", paste(v, collapse = " ")))
    print(paste("Max:", cis64Max(v)))
    print(paste("Min:", cis64Min(v)))
    print(paste("Sum:", cis64Sum(v)))
    print(paste("Prod:", cis64Prod(v)))
}

#testcases
v1 <- c(1, 20, 21, 7, 101)
v2 <- c(1, 10, 11, "String")
v3 <- c(1:101)
v4 <- c(1, "two", TRUE, list(1, 2, 3), "three", FALSE, NA)
displayResults(v1)
displayResults(v2)
displayResults(v3)
displayResults(v4)

library(ggplot2)

presentData <- function(v) {
    pepsi <- 0
    sprite <- 0
    fanta <- 0
    mug <- 0
    for (num in v) {
        if (num == 1) pepsi <- pepsi + 1
        if (num == 2) sprite <- sprite + 1
        if (num == 3) fanta <- fanta + 1
        if (num == 4) mug <- mug + 1
    }

    # table showing data
    result <- data.frame(Pepsi = pepsi, Sprite = sprite, Fanta = fanta, Mug = mug)
    print("***Tabled Data***")
    print(result)
    print("*****************")

    # boxplot showing data
    frame <- data.frame(v)
    g <- ggplot(frame, aes(x = v))
    g <- g + geom_boxplot()
    g <- g + labs(title = "Soda Preferences of the Student Body", x = "Soda")
    g <- g + scale_x_continuous(breaks = 1:4, labels = c("Pepsi", "Sprite", "Fanta", "Mug"))
    g <- g + theme(
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
    )
    plot(g)
}

# testcases
data <- c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)

presentData(data)