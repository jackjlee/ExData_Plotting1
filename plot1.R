power_all<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
power_sub<-power_all[power_all$Date == "1/2/2007" | power_all$Date == "2/2/2007",]

mydates<-as.Date(power_sub$Date,format="%d/%m/%Y")
mytimes<-paste(mydates,power_sub$Time)

power_sub$Date <- mydates
power_sub$Time <- strptime(mytimes,format="%Y-%m-%d %H:%M:%S")

hist(as.numeric(power_sub$Global_active_power)
     ,col="red"
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)" )

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()