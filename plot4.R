require(lubridate)
require(dplyr)

## Read table into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?")

## Convert data types and filter down to desired date range
power$Date <- dmy(power$Date)
power <- filter(power, between(Date, ymd("2007-02-01"), ymd("2007-02-02")))
power$Time <- hms(power$Time)





## Set the graphic device
png("plot4.png", width = 480, height = 480)

## Set grid
par(mfrow = c(2, 2))

with(power, {
## Build plot1
plot(datetime, Global_active_power, type = "l",xlab="",
     ylab="Global Active Power")

## Build plot2
plot(datetime, Voltage, type = "l")

## Build plot3
plot(datetime, Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(datetime, Sub_metering_2, col = "Red")
lines(datetime, Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), 
       legend = names(power)[7:9], bty = "n")

## Build plot4
plot(datetime, Global_reactive_power, type = "l")
})


## Set the graphic device
dev.off()