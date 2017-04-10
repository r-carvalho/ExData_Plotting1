powerdata <- "household_power_consumption.txt"
Dataset <- read.table(powerdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DS <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007") ,]

DS$Date <- as.Date(DS$Date, format = "%d/%m/%Y")

dateTime <- as.POSIXct(paste(DS$Date, DS$Time))
globalActivePower <- as.numeric(DS$Global_active_power)

subM1 <- as.numeric(subSetData$Sub_metering_1)
subM2 <- as.numeric(subSetData$Sub_metering_2)
subM3 <- as.numeric(subSetData$Sub_metering_3)

globalReactivePower <- as.numeric(DS$Global_active_power)
voltage <- as.numeric(DS$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subM2, type="l", col="red")
lines(dateTime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()