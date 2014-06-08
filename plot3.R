## housekeeping

plotName <- "plot3.png"
## Getting full dataset
dataset <- read.csv("./Data/household_power_consumption.txt", 
                    header=T, sep=';', 
                    na.strings="?",
                    nrows=2075259, 
                    check.names=F, 
                    stringsAsFactors=F, 
                    comment.char="", 
                    quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## removing dataset from memory
rm(dataset)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3  480 x 480 pixels
png(filename=plotName,
    height = 480,
    width = 480)

with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Closing / Saving to file

dev.off()