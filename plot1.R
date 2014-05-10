### plot1.R
setwd("./ExData_Plotting1")
## create rawData directory
# if (!file.exists("rawData")) {
#   dir.create("rawData")
# }

## download data
# fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileUrl, destfile = "./rawData/UCI_household_power_consumption.zip", method = "curl")
# dateDownloaded <- date()

## Unzip the file into the dir
# unzip("./rawData/UCI_household_power_consumption.zip", exdir = "./rawData")

## load data
raw <- read.table("./rawData/household_power_consumption.txt", na.strings = "?" , header = TRUE, sep = ";")
str(raw)

## create subset of data for plotting
datesWanted <- c("1/2/2007", "2/2/2007")
dataCut <- raw[raw$Date %in% datesWanted, ]
rm(dateDownloaded, fileUrl, raw, datesWanted)

# check dataframe ok
str(dataCut)
head(dataCut)
summary(dataCut)

## make dateTime
dataCut$dateTime<- paste(dataCut$Date, dataCut$Time, sep=" ")
dataCut$dateTime <- strptime(dataCut$dateTime, "%d/%m/%Y %H:%M:%S")

## Create plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(dataCut$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()


