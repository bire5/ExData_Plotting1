po <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
po$Date <- as.Date(po$Date, "%d/%m/%Y")
  
## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
po <- subset(po,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
## Remove incomplete observation
po <- po[complete.cases(po),]

## Combine Date and Time column
dateTime <- paste(po$Date, po$Time)
  
## Name the vector
dateTime <- setNames(dateTime, "DateTime")
  
## Remove Date and Time column
po <- po[ ,!(names(po) %in% c("Date","Time"))]
  
## Add DateTime column
po <- cbind(dateTime, po)
  
## Format dateTime Column
po$dateTime <- as.POSIXct(dateTime)