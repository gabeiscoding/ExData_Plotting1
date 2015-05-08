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

#Generate plot2
png(file = 'plot2.png', width=504, height=504,  bg = "transparent")
plot(Global_active_power ~ datetime, data=df, type='n', xlab='', ylab='Global Active Power (kilowatts)')
lines(Global_active_power ~ datetime, data=df, lty=1)
dev.off()
