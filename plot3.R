dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
smallerdataset <- subset(dataset, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2" ))
dateTime <- paste(smallerdataset$Date, smallerdataset$Time)
dateTime <- setNames(dateTime, "DateTime")
smallerdataset <- cbind(dateTime, smallerdataset)
smallerdataset$dateTime <- as.POSIXct(dateTime)
with(smallerdataset, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

