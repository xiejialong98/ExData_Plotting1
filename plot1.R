# load data
dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
required_data <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007",]

# remove missing data and convert Global Active Power to numeric
GAP <- as.numeric(as.character(required_data$Global_active_power))

# Draw a histogram of Global Active Power
hist(GAP, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()