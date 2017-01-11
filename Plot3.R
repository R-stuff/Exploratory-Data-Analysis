library(dplyr)
library(lubridate)

### PLOT 3

# reading relevant data
Actual2 <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, casting to right classes
Actual2 <- Actual2 %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                              V7 = as.numeric(as.character(V7)),
                              V8 = as.numeric(as.character(V8)),
                              V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

View(Actual2)

# create plot
with(Actual2, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(Actual2, points(V1,V7, col="black", type="l"))
with(Actual2, points(V1,V8, col="red", type="l"))
with(Actual2, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")

       
#Saving to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
       