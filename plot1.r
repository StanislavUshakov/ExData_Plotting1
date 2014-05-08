data <- read.csv("household_power_consumption.txt", sep=";", dec=".")
d <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
d[, "Global_active_power"] <- as.numeric(d[, "Global_active_power"])
d[, "Date"] <- as.Date(d[, "Date"], "%d/%m/%Y")
png("plot1.png")
hist(x=d[, "Global_active_power"], col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
