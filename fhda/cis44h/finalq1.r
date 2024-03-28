# Caden Pun 3/28/24

cis64CMax <- function(v) {
    max <- -Inf
    for (i in seq_along(v)) {
        if (!is.numeric(v[i]) || is.na(v[i])) return('NA')
        if (v[i] > max) {
            max <- v[i]
        }
        v[i] <- max
    }
    return(v)
}

cis64CMin <- function(v) {
    min <- Inf
    for (i in seq_along(v)) {
        if (!is.numeric(v[i]) || is.na(v[i])) return('NA')
        if (v[i] < min) {
            min <- v[i]
        }
        v[i] <- min
    }
    return(v)
}

cis64CSum <- function(v) {
    sum <- 0
    for (i in seq_along(v)) {
        if (!is.numeric(v[i]) || is.na(v[i])) return('NA')
        sum <- sum + v[i]
        v[i] <- sum
    }
    return(v)
}

cis64CProd <- function(v) {
    prod <- 1
    for (i in seq_along(v)) {
        if (!is.numeric(v[i]) || is.na(v[i])) return('NA')
        prod <- prod * v[i]
        v[i] <- prod
    }
    return(v)
}

cis64Diff <- function(v) {
    diff <- c()
    for (i in seq_along(v)[-length(seq_along(v))]) {
        if (!is.numeric(v[i]) || is.na(v[i])) return('NA')
        diff <- c(diff, v[i+1]-v[i])
    }
    return(diff)
}

displayResults <- function(v) {
    print("**************************")
    print(paste("Original Vector:", paste(v, collapse = " ")))
    print(paste("Cumulative Max:", paste(cis64CMax(v), collapse = " ")))
    print(paste("Cumulative Min:", paste(cis64CMin(v), collapse = " ")))
    print(paste("Cumulative Sum:", paste(cis64CSum(v), collapse = " ")))
    print(paste("Cumulative Prod:", paste(cis64CProd(v), collapse = " ")))
    print(paste("Diff:", paste(cis64Diff(v), collapse = " ")))
}

#testcases
v1 <- c(1, 20, 21, 7, 101)
v2 <- c(1, 10, 11, "String")
v3 <- c(1:50)
v4 <- c(1, "two", TRUE, list(1, 2, 3), "three", FALSE, NA)
v5 <- c(20, 15, 100, 99, 130, 1, 21)
displayResults(v1)
displayResults(v2)
displayResults(v3)
displayResults(v4)
displayResults(v5)