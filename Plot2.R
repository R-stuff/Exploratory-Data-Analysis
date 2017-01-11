library(dplyr)
library(lubridate)

### PLOT 2

# reading relevant data
Actual1 <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, casting to right classes
Actual1 <- Actual1 %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                              +                         V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

# create plot
with(Actual1, plot(V1, V3, type = "l", xlab = "Day", ylab = "Global Active Power (KW)"))

#Saving to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()