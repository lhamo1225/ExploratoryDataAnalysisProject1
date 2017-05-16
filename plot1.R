## loading data

setwd("/Users/fnugongsalamu/Desktop/Coursera/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## subset data

sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## format date and time
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Export
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()