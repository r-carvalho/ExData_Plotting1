powerdata <- "household_power_consumption.txt"
Dataset <- read.table(powerdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DS <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007") ,]

DS$Date <- as.Date(DS$Date, format = "%d/%m/%Y")

dateTime <- as.POSIXct(paste(DS$Date, DS$Time))
globalActivePower <- as.numeric(DS$Global_active_power)


png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()