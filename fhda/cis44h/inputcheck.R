# how many integers to ask for
repeat {
    data <- readline("How many integers do you wish to input (whole number please): ")
    # suppressWarnings gets rid of NA coercion warnings
    num <- suppressWarnings(as.numeric(data))
    # if num is a valid numeric and is an integer and is a whole number
    if (!is.na(num) && num %% 1 == 0 && num > 0) {
        count <- as.integer(data)
        break
    } else {
        print("That is not a whole amount of integers")
    }
}
v <- c()

# which integers are we testing
while (count > 0) {
    repeat {
        data <- readline("Input an integer: ")
        # suppressWarnings gets rid of NA coercion warnings
        num <- suppressWarnings(as.numeric(data))
        # if num is a valid numeric and is an integer
        if (!is.na(num) && num %% 1 == 0) {
            v <- append(v, as.integer(data))
            break
        } else {
            print("That is not an integer")
        }
    }
    count <- count - 1
}

# test for bounds and calc square if necessary
for (i in v) {
    # Assuming range is inclusive
    if (0 <= i && i <= 100) {
        print(paste(i, paste("is between 0 and 100, and its square is", i^2)))
    } else {
        print(paste(i, "is not in range"))
    }
}
