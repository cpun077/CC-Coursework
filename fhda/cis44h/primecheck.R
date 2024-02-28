i <- integer()
# ask for integer b/w 2 and 99 inclusive
repeat {
    data <- readline("Input an integer between 2 and 99: ")
    # suppressWarnings gets rid of NA coercion warnings
    num <- suppressWarnings(as.numeric(data))
    # if num is a valid numeric, an integer, and in the range
    if (!is.na(num) && num %% 1 == 0 && 2 <= num && num <= 99) {
        i <- as.integer(data)
        break
    } else {
        print("That is not a valid value please retry")
    }
}

prime <- function(num) {
    if (num == 1) return(list(FALSE, 1))
    for (factor in 2:ceiling(sqrt(num))) {
        if (num %% factor == 0) return(list(FALSE, factor))
    }
    return(list(TRUE, 1))
}

if (prime(i)[[1]]) {
    print(paste(i, "is a prime number"))
} else {
    print(paste(i, "is divisible by", prime(i)[[2]]))
}