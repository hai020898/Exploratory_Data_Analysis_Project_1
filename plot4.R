dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
smallerdataset <- subset(dataset, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2" ))
dateTime <- paste(smallerdataset$Date, smallerdataset$Time)
dateTime <- setNames(dateTime, "DateTime")
smallerdataset <- cbind(dateTime, smallerdataset)
smallerdataset$dateTime <- as.POSIXct(dateTime)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(smallerdataset, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global_reactive_power",xlab="")
})

dev.off()

