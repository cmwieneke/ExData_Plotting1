require(data.table)
pd <- fread("household_power_consumption.txt")

pd$Date <- as.Date(pd$Date, "%d/%m/%Y")

pd<-subset(pd, Date >= as.Date("2/1/2007","%m/%d/%Y") & Date <= as.Date("2/2/2007","%m/%d/%Y"), select = (1:9))

pd$Global_active_power <- as.numeric(pd$Global_active_power)
pd$Sub_metering_1 <- as.numeric(pd$Sub_metering_1)
pd$Sub_metering_2 <- as.numeric(pd$Sub_metering_2)
pd$Sub_metering_3 <- as.numeric(pd$Sub_metering_3)
pd$Voltage <- as.numeric(pd$Voltage)
pd$Global_reactive_power <- as.numeric(pd$Global_reactive_power)

png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(as.POSIXct(paste(pd$Date, pd$Time)),pd$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power" )

plot(as.POSIXct(paste(pd$Date, pd$Time)),pd$Voltage, type = "l", xlab = "datetime",ylab = "Voltage" )


plot(as.POSIXct(paste(pd$Date, pd$Time)),pd$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering" )
lines(as.POSIXct(paste(pd$Date, pd$Time)),pd$Sub_metering_2, col= "red", type = "l")
lines(as.POSIXct(paste(pd$Date, pd$Time)),pd$Sub_metering_3, col= "blue", type = "l")
legend("topright", lty=c(1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(as.POSIXct(paste(pd$Date, pd$Time)),pd$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )

dev.off()