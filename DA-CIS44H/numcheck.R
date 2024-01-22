v <- c(1, 9, 5, 3, 4, 2, 8, 7, 6, 10)
for (num in v) {
    if (num %% 2 == 0) {
        print(paste(num, "is an even number."))
    } else {
        print(paste(num, "is an odd number."))
    }
}

# Extra stuff
range_vector <- 1:10

print(seq(1, 10, by = 1))
print(seq(2, 10, length.out = 5))

m <- matrix(1:10, 5, 2, byrow = FALSE, dimnames = list(c('a', 'b', 'c', 'd', 'e'), c('A', 'B')))
print(dim(m))
m <- cbind(m, 11:15)
colnames(m)[3] <- 'C'
print(m)

l <- list(c(1:12), c('jan', 'feb', 'mar'), sin)
for (slice in l) {
    #slices are like [[1]] which is the first row
    print(slice)
}
print(length(l))

a <- array(v, dim = c(2, 5))
print(a)

d <- data.frame(Number = c(1:3), Month = c("Jan", "Feb", "Mar"), Description = c("Cold", "Cold", "Rain"))
print(d)
print(str(d))
print(summary(d))
