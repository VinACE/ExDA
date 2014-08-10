

#Reading the files
setwd("C:/EMC_V/course_era/DataScience_specialization/Exploratory Analysis/exdata-data-household_power_consumption")
getwd()
colclasses = c("character", "character", rep("numeric",7))

home_data <- read.csv('household_power_consumption.txt',colClasses = colclasses, na.strings=c("?"), sep=";")
summary(home_data)

# Converting DateTime  to a real Date
#home_data$Date = as.POSIXct(strptime(home_data$Date, format = "%d/%m/%Y"))


home_data$DateTime <- as.POSIXct(paste(home_data$Date, home_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

home_data = subset(home_data, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

#Ploting the data
png(filename="plot2.png", width = 480, height = 480)
with(home_data, plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab=""))
#with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")))
dev.off()
