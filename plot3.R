dataFile <- "C:/Users/linj49/Documents/DataFiles/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
#strptime converts a string into a certain format as indicated by the second 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #use paste for concatenation
globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,Sub_metering_2, type="l", col ="red")
lines(datetime,Sub_metering_3, type="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
