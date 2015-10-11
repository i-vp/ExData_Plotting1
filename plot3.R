data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$timetemp <- paste(data$Date, data$Time)
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
data <- data[,1:9]
sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = "plot3.png", width = 480, height = 480)

with(sub, plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "l", col="black"))
with(sub, lines(Time, Sub_metering_2, col="red"))
with(sub, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()