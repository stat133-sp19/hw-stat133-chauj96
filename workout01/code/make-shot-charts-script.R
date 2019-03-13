#title: shot charts
#description: the creation of shot charts
#input: jpg file
#output: pdf file

library(jpeg)
library(grid)
library(ggplot2)

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))


# klay thompson shot chart
klay_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()



# andre-iguodala shot chart
andre_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_shot_chart
dev.off()



# draymond green shot chart
draymond_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart
dev.off()



# kevin durant shot chart
kevin_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_shot_chart
dev.off()



# stephen curry shot chart
stephen_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
stephen_shot_chart
dev.off()



# shot chart by player
gsw_shot_charts <- ggplot(data = one) + annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + facet_wrap(~ name) +
  ggtitle('Shot Chats: GSW (2016 season)') +
  theme_minimal()

# make it as pdf file
pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_charts
dev.off()

# make if as png file
png(filename = "../images/gsw-shot-charts.png", width = 768, height = 672 )
gsw_shot_charts
dev.off()

