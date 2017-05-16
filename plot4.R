## loading data

#setwd("/Users/fnugongsalamu/Desktop/Coursera/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## subset data

sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## format date and time
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2))
plot(sub_data$Global_active_power, xlab="Global Active Power", ylab="Frequency", type="l")
plot(sub_data$Voltage~sub_data$Datetime, type = "l",ylab = "Voltage", xlab="datetime")
plot(sub_data$Sub_metering_1~sub_data$Datetime, type = "l",ylab = "Energy sub metering ", xlab="")
lines(sub_data$Sub_metering_2~sub_data$Datetime, type = "l",col = "Red")
lines(sub_data$Sub_metering_3~sub_data$Datetime, type = "l",col = "Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(sub_data$Global_reactive_power~sub_data$Datetime, type = "l", xlab="datetime")

## Export
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()