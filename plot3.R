#Exploratory Data Analysis Project1
library(dplyr)
library(data.table)

#Assumes project data downloaded and unzipped into 'wd'
initial <- read.table('household_power_consumption.txt', sep=";", stringsAsFactors = FALSE, nrows = 100, header=TRUE)
classes <- sapply(initial, class)
df <- data.table(read.table('household_power_consumption.txt', sep=";", stringsAsFactors = FALSE, header=TRUE, colClasses=classes, na.strings="?"))

#Subset to 2007-02-01 and 2007-02-02.
df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
df <- cbind(df, datetime=do.call(function(Date, Time,...) strptime(paste(Date, Time), format="%d/%m/%Y %T"), df))

#Generate plot3
png(file = 'plot3.png', width=504, height=504,  bg = "transparent")
plot(Sub_metering_1 ~ datetime, data=df, type='n', xlab='', ylab='Energy sub metering')
lines(Sub_metering_1 ~ datetime, data=df, lty=1, col='black')
lines(Sub_metering_2 ~ datetime, data=df, lty=1, col='red')
lines(Sub_metering_3 ~ datetime, data=df, lty=1, col='blue')
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
