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
png("plot3.png", width=480, height=480, units = "px")

plot(data$timestamp,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",col="black")
lines(data$timestamp, data$Sub_metering_2,col="red")
lines(data$timestamp, data$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

dev.off()
