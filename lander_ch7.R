# Examples of plot and ggplot2 using starwars data set.
# 09-15-19
# RJ Podeschi
# Adapted from lab exercises used in "R for Everyone" 2nd ed. Lander, H.

library("dplyr")
data("starwars")

plot(mass ~ height, data = starwars, xlab = "Height (cm)", ylab = "Mass (kg)", 
    main = "Starwars characters, height, mass scatterplot")

hist(starwars$birth_year, xlab = "Birth year", 
    main = "Histogram, birth year - Before battle of Yavin")

library("ggplot2")

# Use ggplot instead of plot
ggplot(data = starwars) + aes(x = height, y = mass) + geom_point()

ggplot(data = starwars) + geom_histogram(aes(x = birth_year))

# Now, apply some theming so it looks pretty
library("ggthemes")

# Density plot by gender
ggplot(data = starwars) + geom_density(aes(x = height), fill = "blue") + 
  facet_wrap(~gender, scales = "free") + theme_bw()

# Box-plot of characters heights if they are human, droid, wookie, or yoda

ggplot(subset(starwars, species %in% c("Human", "Droid", "Wookie",
  "Yoda's species")), aes(y = height, x = species)) + geom_boxplot() + 
  theme_economist()
