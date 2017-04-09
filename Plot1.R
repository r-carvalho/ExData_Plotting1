powerdata <- "household_power_consumption.txt"
Dataset <- read.table(powerdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DS <- Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007") ,]
DS$Date <- as.Date(DS$Date, format = "%d/%m/%Y")
globalActivePower <- as.numeric(DS$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()