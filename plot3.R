##Clean Data Set
power <- read.table("household_power_consumption.txt", header =TRUE, sep = ";", na.strings="?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
powerSubset <- subset(power, (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Combine Date and Time into one Column
dateTime <- paste(powerSubset$Date, powerSubset$Time, sep = " ")
powerSubset$dateTime <- as.POSIXct(dateTime)
##plot3
with(powerSubset, {
	plot(Sub_metering_1 ~ dateTime, type="l", xlab = "", ylab="Energy sub metering")
	lines(Sub_metering_2 ~ dateTime, col= "red")
	lines(Sub_metering_3 ~ dateTime, col= "blue")
	legend("topright", col = c("black", "red", "blue"), lty = 1, xjust = 0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()