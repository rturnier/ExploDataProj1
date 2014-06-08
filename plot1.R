source("autoload.R")
options(stringsAsFactors = FALSE)
data <- read.table(paste(dataPath,"household_power_consumption.txt",sep = "/"), 
                   skip = 66636,
                   nrow = 2880,
                   header = TRUE,
                   sep = ";",
                   quote="\"")

colnames(data) <- c("Date",
                    "Time",
                    "Global_Active_Power",
                    "Global_Reactive_Power",
                    "Voltage",
                    "Global_intensity",
                    "Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_meteing_3")

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")

# add the plot to the output folder
fnPlot <- paste(outputPath,"plot1.png",sep = "/")

# open device
png(filename=fnPlot,
      height = 480,
      width = 480)

# generate the plot
hist(as.numeric(data$Global_Active_Power), col = "red",
                              main = "Global Active Power",
                              ylab = "Frequency",
                              xlab = "Global Active Power (kilowatts)")
# close/save the file
dev.off()
