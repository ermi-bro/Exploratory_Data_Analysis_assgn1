# This program downloads data from Electric power consumption website and produced Global Active Power histogram:
# the exection of the program organized in four steps as follows

## STEP 1: Setup working directory
setwd("C:\\rproj\\Exploratory_Data_Analysis\\assig1\\")

## STEP 2: Download zipped file and unzipped it in the working folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="elec1.zip")
data <- unzip("elec1.zip")
assgndata <- read.table(data, sep=";", head = T, na.strings="?", stringsAsFactors=F)
# calculating memory requirements
(2075259 * 9 * 8)/2^20 # bytes/numeric
# 142.4967 MB

## STEP 3: Subsetting the dataset from the dates 2007-02-01 and 2007-02-02
subdata <- subset(assgndata, Date == "1/2/2007" | Date =="2/2/2007")
rm(assgndata)
str(subdata)

## STEP 4: Producung histogram using Global Active Power variable
# Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "red", xlab  = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
