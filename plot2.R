#reading data in
file <- "household_power_consumption.txt"
numRows <- 69517 - 66637
header <- read.table(file, sep=";", header=TRUE, nrows = 1,na.strings = "?"); #just to read in the column names
data <- read.table(file, sep=";", header=FALSE, skip=66637, nrows=numRows, na.strings = "?");
colnames(data) <- colnames(header)

#processing time and date to create timestamp
data$timestamp <- paste(as.character(data$Date),as.character(data$Time))
data$timestamp <- strptime(data$timestamp, "%d/%m/%Y %H:%M:%S")

#plot to png
png("plot2.png", width=480, height=480, units = "px")

plot(data$timestamp,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
