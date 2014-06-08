power_all<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
power_sub<-power_all[power_all$Date == "1/2/2007" | power_all$Date == "2/2/2007",]

mydates<-as.Date(power_sub$Date,format="%d/%m/%Y")
mytimes<-paste(mydates,power_sub$Time)

power_sub$Date <- mydates
power_sub$Time <- strptime(mytimes,format="%Y-%m-%d %H:%M:%S")

plot(power_sub$Time,power_sub$Sub_metering_1
     ,type="l"
     ,cex.axis=0.8
     ,cex.lab=0.8
     ,xlab=""
     ,ylab="Energy sub metering")

lines(power_sub$Time,power_sub$Sub_metering_2
      ,col="red")

lines(power_sub$Time,power_sub$Sub_metering_3
      ,col="blue")

legend("topright"
       ,lwd=c(1,1,1)
       ,cex=0.8
       ,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()