count <- as.integer(readline("How many integers do you wish to input (whole number please): "))
v <- c()

while (count > 0) {
    v <- append(v, as.integer(readline("Input an integer: ")))
    count <- count - 1
}

for (i in v) {
    # Assuming range is inclusive
    if (0 <= i && i <= 100) {
        print(paste(i, paste("is between 0 and 100, and its square is", i^2)))
    } else {
        print(paste(i, "is not in range"))
    }
}
