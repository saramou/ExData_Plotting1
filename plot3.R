#Load the data set from the working directory
data<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE)

#Convert into Date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#subset with only the dates between 01 & 02-02-2007
Subdata<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")

#Create a Date with time for the subset
Subdata$DateTime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

#create plot one by one
with(Subdata,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))
lines(Subdata$DateTime,Subdata$Sub_metering_2,type="l",col="red")
lines(Subdata$DateTime,Subdata$Sub_metering_3,type="l",col="blue")

#???Add legend
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()