library(dplyr)
library(lubridate)

### PLOT 1

# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";")
View(data)
Actual <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
View(Actual)

# clearing name row and unrelevant variables, creating numerics
Actual <- Actual %>% select(V3)
View(Actual)
Actual <- Actual %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# create histogram
hist(Actual$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (KW)", ylab = "Frequency")

#Saving to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
