# load data
dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
required_data <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

# remove missing data and convert Global Active Power to numeric
GAP <- as.numeric(as.character(required_data$Global_active_power))

# convert to time/date format
required_data$Date <- as.Date(required_data$Date, "%d/%m/%Y")
datetime <- paste(as.Date(required_data$Date), required_data$Time)
required_data$Datetime <- as.POSIXct(datetime)

# plot
plot(required_data$Datetime, GAP, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()