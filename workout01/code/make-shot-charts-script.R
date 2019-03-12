#title: make-shot-charts-script.R
#description: This file makes shot charts
#inputs: nba-court.jpg, 
#outputs:stephen-curry-shot-chart.pdf, andre_iguodala_shot_chart.pdf,
#draymond_green_shot_chart.pdf,kevin_durant_shot_chart.pdf,
#klay_thompson_shot_chart.pdf
library(ggplot2)
library(jpeg)
library(grid)

#court_image 
court_file <- "../imirenee/desktop/workout01/images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)

# use court background to plot shot chart
stephen_curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420)+
  ggtitle("Shot Chart : Stephen Curry (2016 season)")+
  theme_minimal()

andre_iguodala_shot_chart <- ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420)+
  ggtitle("Shot Chart : Andre Iguodala (2016 season)")+
  theme_minimal()

draymond_green_shot_chart <- ggplot(data = draymond) +
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420)+
  ggtitle("Shot Chart : Draymond Green (2016 season)")+
  theme_minimal()

kevin_durant_shot_chart <- ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420)+
  ggtitle("Shot Chart : Kevin Durant (2016 season)")+
  theme_minimal()

klay_thompson_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50,420)+
  ggtitle("Shot Chart : Klay Thompson (2016 season)")+
  theme_minimal()

# create shot charts and save them in pdf format
pdf(file = "../imirenee/desktop/workout01/images/stephen-curry-shot-chart.pdf",
    width = 6.5, height = 5)
stephen_curry_shot_chart
dev.off()

pdf(file = "../imirenee/desktop/workout01/images/andre-iguodala-shot-chart.pdf",
    width = 6.5, height = 5)
andre_iguodala_shot_chart
dev.off()

pdf(file = "../imirenee/desktop/workout01/images/kevin-durant-shot-chart.pdf",
    width = 6.5, height = 5)
kevin_durant_shot_chart
dev.off()

pdf(file = "../imirenee/desktop/workout01/images/klay-thompson-shot-chart.pdf",
    width = 6.5, height = 5)
klay_thompson_shot_chart
dev.off()

pdf(file = "../imirenee/desktop/workout01/images/draymond-green-shot-chart.pdf",
    width = 6.5, height = 5)
draymond_green_shot_chart
dev.off()

#Facetted shot chart
#Show all the shot charts in one image
shot_chart <- ggplot(data = NBA) + annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag),size = 0.5) +
  ylim(-50,420)+ ggtitle("Shot Chart : GSW (2016 season)") +
  theme_minimal() + facet_wrap(~name)

#Save the image in pdf format
pdf(file = "../imirenee/desktop/workout01/images/gsw-shot-charts.pdf",
    height = 7, width = 8)
shot_chart
dev.off()

#save the image in png format
png(filename = "../imirenee/desktop/workout01/images/gsw-shot-charts.png",
    width = 768, height = 672, units = "px")
shot_chart
dev.off()
