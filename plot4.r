data <- read.csv("household_power_consumption.txt", sep=";", dec=".")
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d[, "Global_active_power"] <- as.numeric(d[, "Global_active_power"])
d[, "Date"] <- as.Date(d[, "Date"], "%d/%m/%Y")
png("plot4.png")

par(mfrow=c(2, 2))

plot(d[, "Global_active_power"], xaxt = "n", type = "l", ylab="Global Active Power (kilowatts)", xlab="")
axis(1, at = c(0, nrow(d) / 2, nrow(d)), labels = c("Thu", "Fri", "Sat"))

plot(d[, "Voltage"], xaxt = "n", type = "l", ylab="Voltage", xlab="datetime")
axis(1, at = c(0, nrow(d) / 2, nrow(d)), labels = c("Thu", "Fri", "Sat"))

plot(d[, "Sub_metering_1"], xaxt = "n", type = "l", ylab="Energy sub metering", xlab="")
lines(d[, "Sub_metering_2"], xaxt = "n", type = "l", col="Red")
lines(d[, "Sub_metering_3"], xaxt = "n", type = "l", col="Blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), 
       lty=c(1, 1, 1))
axis(1, at = c(0, nrow(d) / 2, nrow(d)), labels = c("Thu", "Fri", "Sat"))

plot(d[, "Global_reactive_power"], xaxt = "n", type = "l", ylab="Global_reactive_power", xlab="datetime")
axis(1, at = c(0, nrow(d) / 2, nrow(d)), labels = c("Thu", "Fri", "Sat"))

dev.off()