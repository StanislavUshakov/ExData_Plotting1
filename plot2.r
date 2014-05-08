data <- read.csv("household_power_consumption.txt", sep=";", dec=".")
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d[, "Global_active_power"] <- as.numeric(d[, "Global_active_power"])
d[, "Date"] <- as.Date(d[, "Date"], "%d/%m/%Y")
png("plot2.png")
plot(d[, "Global_active_power"], 
     xaxt = "n", 
     type = "l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
axis(1, at = c(0, nrow(d) / 2, nrow(d)), labels = c("Thu", "Fri", "Sat"))
dev.off()