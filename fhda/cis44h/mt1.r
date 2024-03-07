v <- as.character(1:100)

for (i in seq_along(v)) {
    num <- suppressWarnings(as.integer(v[i]))
    if (num %% 3 == 0 && num %% 5 == 0) {
        num <- "FizzBuzz"
    } else if (num %% 3 == 0) {
        num <- "Fizz"
    } else if (num %% 5 == 0) {
        num <- "Buzz"
    }
    v[i] <- num
}
print(v)
# data frame is basically a data table not a 2d array
# just "hello world" in the console prints as-is; in R file does nothing
# R is a procedural language apparently

# slides 5 notes
# math - abs(), sign(), ceiling/floor(), exp/log/log2/log10()
# statistics - for cumulative add cum(min/max()), sum/prod/diff(), mean/median/mode()
# matrices - t() transpose, %*% multiply, det() determinant, solve() inverse