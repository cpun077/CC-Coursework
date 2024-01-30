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

# test if the integer is a prime number
# we don't have to check for 1 since its an integer
# number is >=2 based on our range check so we don't have to check for 0 or 1
if (i %% 2 == 0 && i != 2) {
    print(paste(i, "is divisible by 2"))
} else if (i %% 3 == 0 && i != 3) {
    print(paste(i, "is divisible by 3"))
} else {
    print(paste(i, "is a prime number"))
}