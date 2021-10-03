## Code to create the 1st plot of the assignment in the "Exploratory Data Analysis" course
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


## 3. First Graph

hist(data$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


##END.
