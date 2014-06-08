## housekeeping

plotName <- "plot2.png"
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


## Plot 2  480 x 480 pixels
png(filename=plotName,
    height = 480,
    width = 480)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()