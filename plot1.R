require(lubridate)
require(dplyr)

## Read table into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")

## Convert data types and filter down to desired date range
power$Date <- dmy(power$Date)
power <- filter(power, between(Date, ymd("2007-02-01"), ymd("2007-02-02")))
power$Time <- hms(power$Time)
power$datetime <- power$Date + power$Time


## Set the graphic device
png("plot1.png", width = 480, height = 480)


## Build the plot
hist(power$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Set the graphic device
dev.off()