## Code to create the 4th plot of the assignment in the "Exploratory Data Analysis" course
## Author: Karl Melgarejo Castillo
## Date: October 2, 2021

## 1. Downloading the data set
# Setting the local path 
setwd("C:/Users/KARL/Dropbox/Cursos online/Johns Hopkins - Coursera/4. Exploratory Data Analysis/Assg 1/ExData_Plotting1")

# Local file
if(!file.exists("./DataSet")){
        dir.create("./DataSet")
}

#Getting the data set
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url1, destfile = "./DataSet/Electric_power_consump.zip")

#Unzip the data in the local file
unzip(zipfile = "./DataSet/Electric_power_consump.zip", exdir = "./DataSet")


## 2. Reading data [2007-02-01 and 2007-02-02]

#read data
data <- read.table("./DataSet/household_power_consumption.txt", sep = ";", header = T) 
#change Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#keep just between 2007/02/01 and 2007/02/02
data <- data[(data$Date >= "2007/02/01" & data$Date <= "2007/02/02"), ]
#change to Time format 
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#change to Numeric format
data$Global_active_power <- as.numeric(data$Global_active_power)


## 3. Forth Graph

par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$Time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Time, data$Sub_metering_2, type = "l", col="red")
lines(data$Time, data$Sub_metering_3, type = "l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1)

plot(data$Time, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

par(mfrow = c(1,1))


##END.
