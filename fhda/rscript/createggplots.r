# Caden Pun 3/3/24

options(scipen = 999) # no sci notation
library(ggplot2)
library(ggalt)
data("midwest", package = "ggplot2")
p <- ggplot(midwest, aes(x = area, y = poptotal))

# scatterplot with line of best fit
p <- p + geom_point(aes(col = state, size = popdensity)) +
  geom_smooth(method = "loess", se = F) +
  xlim(c(0, 0.1)) + ylim(c(0, 500000))
# adjust axis limits; alt method: p <- p + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))

# title and axis labels
p <- p + labs(
  title = "Area Vs Population",
  # subtitle = "From midwest dataset",
  y = "Population", x = "Area",
  caption = "Midwest Demographics"
)

# xaxis ticks
# letters: p <- p + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = letters[1:11])
# percentages:
# p <- p + scale_x_continuous(
#   breaks = seq(0, 0.1, 0.01),
#   labels = sprintf(
#     "%1.2f%%",
#     seq(0, 0.1, 0.01)
#   )
# ) + scale_y_continuous(
#   breaks = seq(0, 1000000, 200000),
#   labels = function(x) {
#     paste0(x / 1000, "K")
#   }
# )

# setting theme; alt method: theme_set(theme_classic())
# p <- p + theme_classic() + labs(subtitle="Classic Theme")
# p <- p + theme_bw() + labs(subtitle = "BW Theme")

# modifying plot title/axis
p <- p + theme(
  plot.title = element_text(
    size = 20,
    face = "bold",
    family = "Serif",
    color = "tomato",
    hjust = 0.5,
    lineheight = 1.2
  ),
  plot.subtitle = element_text(
    size = 15,
    family = "Serif",
    face = "bold",
    hjust = 0.5
  ),
  plot.caption = element_text(size = 15),
  axis.title.x = element_text(
    vjust = 0,
    size = 15
  ),
  axis.title.y = element_text(size = 15),
  axis.text.x = element_text(
    size = 10,
    angle = 30,
    vjust = .5
  ),
  axis.text.y = element_text(size = 10)
)

# modifying legend
p <- p + labs(color = "State", size = "Density")
p <- p + scale_color_manual(
  name = "State",
  labels = c(
    "Illinois",
    "Indiana",
    "Michigan",
    "Ohio",
    "Wisconsin"
  ),
  values = c(
    "IL" = "blue",
    "IN" = "red",
    "MI" = "green",
    "OH" = "brown",
    "WI" = "orange"
  )
)
p <- p + guides(
  colour = guide_legend(order = 2),
  size = guide_legend(order = 1)
) +
  theme(legend.position = "bottom", legend.box = "horizontal")

# annotations
midwest_sub <- midwest[midwest$poptotal > 300000, ]
midwest_sub$large_county <- ifelse(midwest_sub$poptotal > 300000, midwest_sub$county, "")
p <- p + geom_text(aes(label = large_county), size = 2, data = midwest_sub)

# flip axis: p <- p + coord_flip()
# reverse axis: p <- p + scale_x_reverse() + scale_y_reverse()

# encircle points
midwest_select <- midwest[
  midwest$poptotal > 350000 &
  midwest$poptotal <= 500000 &
  midwest$area > 0.01 &
  midwest$area < 0.1,
  # want all columns so leave blank here
]
p <- p + geom_encircle(
  aes(x = area, y = poptotal),
  data = midwest_select,
  color = "red",
  size = 2,
  expand = 0.08
)

plot(p)
