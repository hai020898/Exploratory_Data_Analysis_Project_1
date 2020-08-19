dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
smallerdataset <- subset(dataset, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2" ))

hist(smallerdataset$Global_active_power,xlab="Global active power(kilowatts)",main="Global active power", col="orange")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
