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
png("plot4.png", width=480, height=480, units = "px")

#set 2x2 plot setting, row major
par(mfrow=c(2,2))

#plot 1 (0,0)
plot(data$timestamp,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#plot 2 (0,1)
plot(data$timestamp,data$Voltage,type="l",xlab="",ylab="Voltage")

#plot 3 (1,0)
plot(data$timestamp,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",col="black")
lines(data$timestamp, data$Sub_metering_2,col="red")
lines(data$timestamp, data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

#plot 4 (1,1)
plot(data$timestamp,data$Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power (kilowatts)")

dev.off()
