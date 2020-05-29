# load data
dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
required_data <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

# convert to time/date format
required_data$Date <- as.Date(required_data$Date, "%d/%m/%Y")
datetime <- paste(as.Date(required_data$Date), required_data$Time)
required_data$Datetime <- as.POSIXct(datetime)

# remove missing data and convert to numeric
GAP <- as.numeric(as.character(required_data$Global_active_power))
VOLT <- as.numeric(as.character(required_data$Voltage))
required_data$Sub_metering_1 <- as.numeric(as.character(required_data$Sub_metering_1))
required_data$Sub_metering_2 <- as.numeric(as.character(required_data$Sub_metering_2))
required_data$Sub_metering_3 <- as.numeric(as.character(required_data$Sub_metering_3))
GRP <- as.numeric(as.character(required_data$Global_reactive_power))
                  
# plot
par(mfrow = c(2,2))
plot(required_data$Datetime, GAP, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)") # at (1,1)
plot(required_data$Datetime, VOLT, type = "l", xlab = "datetime", ylab = "Voltage") # at (1,2)
plot(required_data$Datetime, required_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") # at (2,1)
lines(required_data$Datetime, required_data$Sub_metering_2, col ="red")
lines(required_data$Datetime, required_data$Sub_metering_3, col ="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", cex = 0.75, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(required_data$Datetime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
