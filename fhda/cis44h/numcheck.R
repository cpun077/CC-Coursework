v <- sample(1:100, 10, replace = FALSE)
print(paste("Vector of 10 randomly sampled # between 1 and 100 without replacement:", paste(v, collapse = " ")))

for (num in v) {
    if (num %% 2 == 0) {
        print(paste(num, "is an even #."))
    } else {
        print(paste(num, "is an odd #."))
    }
}

# Extra stuff
print("******************************")

# %/% is integer division

range_vector <- 1:10
count <- 1
repeat {
    print(paste(range_vector, collapse = " "))
    count <- count + 1
    if (count > 1) {
        break
    }
}
count <- 1
while (count == 1) {
    print(paste(range_vector, collapse = " "))
    count <- count + 1
}

# sequences
print(seq(1, 10, by = 1))
print(seq(2, 10, length.out = 5))

# matrices
m <- matrix(1:10, 5, 2, byrow = FALSE, dimnames = list(c("a", "b", "c", "d", "e"), c("A", "B")))
print(dim(m))
m <- cbind(m, 11:15)
colnames(m)[3] <- "C"
print(m)

# lists
l <- list(c(1:12), c("jan", "feb", "mar"), sin)
for (slice in l) {
    # slices are like [[1]] which is the first row
    print(slice)
}
print(length(l))

# arrays
a <- array(v, dim = c(2, 5))
print(a)

# data frames
d <- data.frame(Number = c(1:3), Month = c("Jan", "Feb", "Mar"), Description = c("Cold", "Cold", "Rain"))
print(d)
print(str(d))
print(summary(d))

# input
goat <- readline("Who's the goat")
print(paste(goat, "is the goat"))

# scan
# read.csv()/read.table()/write.csv()/write.table() for csvs
setwd("C:/users/irons/documents/github/cs-coursework/fhda")
insertcity <- scan(what="character", file="cis44a/resources/insert_city.sql", nlines=2, nmax=10)
print(paste(insertcity, collapse = " "))

library("xlsx")
excel <- read.xlsx(file = "cis44h/sqlspreadsheet.xlsx", sheetIndex = 1)
print(excel)