##load the data
data=read.table("C:\\Users\\frozenl\\Desktop\\coursera\\project 4\\household_power_consumption.txt",
                header=TRUE, sep=";", na.strings = "?", colClasses = 
                    c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##deal with the time
data$Date=as.Date(data$Date, "%d/%m/%Y")
data=subset(data, Date>=as.Date("2007/2/1") & Date<=as.Date("2007/2/2"))
data=data[complete.cases(data), ]
datetime=paste(data$Date, data$Time)
data$datetime=as.POSIXct(datetime)
data=subset(data, select=-c("Date","Time"))
##create the plot1
hist(data$Global_active_power, main="Global active power", xlab="Global active power (kilowattes)", col="red")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()