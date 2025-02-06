# Caden Pun 3/28/24

library(ggplot2)
data("mpg", package = "ggplot2")
p <- ggplot(mpg, aes(x = cty, y = hwy))

p <- p + geom_point(aes(col = manufacturer, size = cty)) +
    geom_smooth(se = FALSE, linewidth = 1.5)

p <- p + labs(
  title = "City vs Highway Mileage",
  subtitle = "Scatterplot with overlapping points",
  y = "Gas mileage on highway", x = "Gas mileage for city driving",
  caption = "CIS 64H Final - Winter 2021"
)
p <- p + labs(color = "Manufacturer", size = "City MPG")

plot(p)