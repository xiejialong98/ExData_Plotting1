# load data
dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
required_data <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

# convert to time/date format
required_data$Date <- as.Date(required_data$Date, "%d/%m/%Y")
datetime <- paste(as.Date(required_data$Date), required_data$Time)
required_data$Datetime <- as.POSIXct(datetime)

# convert sub_metering to numeric
required_data$Sub_metering_1 <- as.numeric(as.character(required_data$Sub_metering_1))
required_data$Sub_metering_2 <- as.numeric(as.character(required_data$Sub_metering_2))
required_data$Sub_metering_3 <- as.numeric(as.character(required_data$Sub_metering_3))

## Saving to file
png("plot3.png", width=480, height=480)

# Plot
plot(required_data$Datetime, required_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(required_data$Datetime, required_data$Sub_metering_2, col ="red")
lines(required_data$Datetime, required_data$Sub_metering_3, col ="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()