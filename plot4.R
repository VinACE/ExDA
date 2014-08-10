

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
png(filename="plot3.png", width = 480, height = 480)
with(home_data, plot(DateTime,Sub_metering_1,type="l", ylab="Energy Sub metering", xlab=""))
lines(home_data$DateTime, home_data$Sub_metering_2, col="red")
lines(home_data$DateTime, home_data$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


par(mfrow = c(2, 2)))
with(home_data, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})