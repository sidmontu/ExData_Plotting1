#reading data in
file <- "household_power_consumption.txt"
numRows <- 69517 - 66637
header <- read.table(file, sep=";", header=TRUE, nrows = 1,na.strings = "?"); #just to read in the column names
data <- read.table(file, sep=";", header=FALSE, skip=66637, nrows=numRows, na.strings = "?");
colnames(data) <- colnames(header)

#plot to png
png("plot1.png", width=480, height=480, units = "px")

hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
