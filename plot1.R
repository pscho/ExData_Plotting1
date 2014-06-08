######################## cleaning & sorting data 

# read in entire data set 
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert date and time variables
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

# subset the data
data = data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

####################### plotting

# make png file
png("plot1.png", width = 480, height = 480)

# make histogram
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)",
     col = "red")
dev.off()