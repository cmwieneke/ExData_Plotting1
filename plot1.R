
require(data.table)
pd <- fread("household_power_consumption.txt")

pd$Date <- as.Date(pd$Date, "%d/%m/%Y")
pd$Global_active_power <- as.numeric(pd$Global_active_power)

pd<-subset(pd, Date >= as.Date("2/1/2007","%m/%d/%Y") & Date <= as.Date("2/2/2007","%m/%d/%Y"), select = (1:9))

png(file = "plot1.png", width=480, height=480)
hist(pd$Global_active_power,col = "red",  main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
