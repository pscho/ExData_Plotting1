######################## cleaning & sorting data 

# read in entire data set 
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# combine date and time into new column
data$DateTime = strptime( paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
# convert date and time variables
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

# subset the data
data = data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

####################### plotting

# make png file
png("plot3.png", width = 480, height = 480)

# make line plot (first line)
plot(data$DateTime,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

# add metering 2 and 3 
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# add a legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 1,
       col = c("black", "red", "blue"))

dev.off()