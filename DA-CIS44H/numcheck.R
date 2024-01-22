v <- c(1, 9, 5, 3, 4, 2, 8, 7, 6, 10)

for (num in v) {
    if (num %% 2 == 0) {
        print(paste(num, "is an even number."))
    } else {
        print(paste(num, "is an odd number."))
    }
}