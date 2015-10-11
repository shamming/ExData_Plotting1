library(data.table)
library(lubridate)

# set working directory
setwd("C:\\Users\\sloh8\\Desktop\\courseradatascience\\4.Exploratory_Data_Analysis\\ExData_Plotting1")

# open raw data and some processing
filename <- "./data/household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";",colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
#head(data)
dim(data)
attach(data)
subset <- Date == "1/2/2007" | Date == "2/2/2007"  # selecting 2 days only
newData <- data[subset, ]
#head(newData)
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
#head(newData)
rownames(newData) <- 1:nrow(newData)
dim(newData) # 2880   10
attach(newData)

# generating plot 2
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(DateTime, Global_active_power, type = "line", lty=1, lwd=1, xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()