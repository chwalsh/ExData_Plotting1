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
png("plot3.png", width = 480, height = 480)


## Build the plot
plot(power$datetime, power$Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(power$datetime, power$Sub_metering_2, col = "Red")
lines(power$datetime, power$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = names(power)[7:9])

## Set the graphic device
dev.off()