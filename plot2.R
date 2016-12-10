#Load the data set from the working directory
data<-read.csv("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors = FALSE)

#Convert into Date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#subset with only the dates between 01 & 02-02-2007
Subdata<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")

#Create a Date with time for the subset
Subdata$DateTime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
with(Subdata,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#create the png file to store the plot
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()