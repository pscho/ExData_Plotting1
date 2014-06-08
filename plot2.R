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
png("plot2.png", width = 480, height = 480)

# make line plot
plot(data$DateTime,
     data$Global_active_power,
     type = "l",
     xlab = "", # empty x-axis title
     ylab = "Global Active Power (Kilowatts)")
dev.off()