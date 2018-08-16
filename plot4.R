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
##create the plot4
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,1,0))
with(data, {
    plot(Global_active_power~datetime, type="l", ylab="Global active power (kilowatts)", xlab="")
    plot(Voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~datetime, type="l", ylab="Global active power (kilowatts)", xlab="")
    lines(Sub_metering_2~datetime, col="red")
    lines(Sub_metering_3~datetime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l", ylab="Global Reactive Power (kilowatts)", xlab="")
})
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()