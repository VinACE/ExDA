

#Reading the files
setwd("C:/EMC_V/course_era/DataScience_specialization/Exploratory Analysis/exdata-data-household_power_consumption")
getwd()
colclasses = c("character", "character", rep("numeric",7))

home_data <- read.csv('household_power_consumption.txt',colClasses = colclasses, na.strings=c("?"), sep=";")
summary(home_data)

# Converting DateTime  to a real Date
home_data$Date = as.POSIXct(strptime(home_data$Date, format = "%d/%m/%Y"))

home_data = subset(home_data, Date >= as.POSIXct("2007-02-01") & Date < as.POSIXct("2007-02-03"))
#Ploting the data
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(home_data$Global_active_power), xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
