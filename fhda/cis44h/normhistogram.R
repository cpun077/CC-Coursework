# Caden Pun 2/29/24

dist1 <- rnorm(100)
dist2 <- rnorm(100)
dist3 <- dist1 * dist2

# mfrow and mfcol arrange matrices of the plots
par(mfrow = c(1, 3))
hist(
    dist1,
    main = "Normal Distribution 1",
    xlab = "Values",
    col = "red",
    border = "white"
)
hist(
    dist2,
    main = "Normal Distribution 2",
    xlab = "Values",
    col = "blue",
    border = "white"
)
hist(
    dist3,
    main = "Normal Distribution 3",
    xlab = "Values",
    col = "yellow",
    border = "white"
)

dists <- list(dist1, dist2, dist3)
for (i in seq_along(dists)) {
    print(paste("Normal Distribution", i))
    print(paste("Mean:", mean(dists[[i]])))
    print(paste("Median:", median(dists[[i]])))
    print(paste("Standard Deviation:", sd(dists[[i]])))
    cat("\n")
}
