##Clean Data Set
power <- read.table("household_power_consumption.txt", header =TRUE, sep = ";", na.strings="?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
powerSubset <- subset(power, (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Combine Date and Time into one Column
dateTime <- paste(powerSubset$Date, powerSubset$Time, sep = " ")
powerSubset$dateTime <- as.POSIXct(dateTime)

##plot1
hist(powerSubset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
##Save as PNG
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()