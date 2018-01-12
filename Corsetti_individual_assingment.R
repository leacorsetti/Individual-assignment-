library('tidyverse')
library(lubridate)
conflict_data <- read.csv("conflict_data_processed.csv")

summary(conflict_data)

conflict_data$deaths_total <- conflict_data$deaths_a + conflict_data$deaths_b + conflict_data$deaths_civilians +conflict_data$deaths_unknown
  

Conflict_1 <- conflict_data %>%
  filter(year <= 2000) %>%
  droplevels()

Conflict_2 <- conflict_data %>%
  filter(year > 2000) %>%
  droplevels()

summary(Conflict_1)
summary(Conflict_2)

install.packages(c("maps", "mapdata"))

library(ggmap)
library(maps)
library(mapdata)

ggplot(data = Conflict_1) +
  geom_polygon(data = map_data('world'), mapping = aes(x = long, y = lat, group=group), fill='white', colour='grey') +
  geom_point(mapping = aes(x=longitude, y=latitude, size= deaths_total), colour = 'red', alpha = 0.3)

ggplot(data=Conflict_2)+
  geom_polygon(data = map_data('world'), mapping = aes(x = long, y = lat, group=group), fill='white', colour='grey') +
  geom_point(mapping = aes(x=longitude, y=latitude, size= deaths_total), colour = 'blue', alpha = 0.3)

# Make the data set with the relevant columns
conflicts.plot <- conflict_data %>%
  mutate(
    years.bin = ifelse(year<2000, 'Before 2000', 'Since 2000')
  )

# Draw the world map and plots
ggplot() +
  geom_polygon(data = map_data('world'), mapping = aes(x = long, y = lat, group=group), fill='white', colour='grey') +
  geom_point(data=conflicts.plot, mapping = aes(x=longitude, y=latitude, size= deaths_total, colour=years.bin), alpha = 0.3)

ggplot() +
  geom_polygon(data = map_data('world'), mapping = aes(x = long, y = lat, group=group), fill='white', colour='grey') +
  geom_point(data=conflicts.plot, mapping = aes(x=longitude, y=latitude, colour=deaths_total), alpha = 0.3) + scale_fill_gradient(trans = "log10")


