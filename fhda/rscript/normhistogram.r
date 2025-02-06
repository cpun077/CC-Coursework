# Caden Pun 2/29/24

dist1 <- rnorm(100)
dist2 <- rnorm(100)
dist3 <- dist1 * dist2

dists <- list(dist1, dist2, dist3)
colors <- c("red", "blue", "yellow")

# mfrow and mfcol arrange matrices of the plots
par(mfrow = c(1, 3))

for (i in seq_along(dists)) {
    # plots
    hist(
        dists[[i]],
        main = paste("Normal Distribution", i),
        xlab = "Values",
        col = colors[i],
        border = "white",
    )
    # statistics
    print(paste("Normal Distribution", i))
    print(paste("Mean:", mean(dists[[i]])))
    print(paste("Median:", median(dists[[i]])))
    print(paste("Standard Deviation:", sd(dists[[i]])))
    cat("\n")
}
