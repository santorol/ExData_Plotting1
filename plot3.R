#Load the data
energyCon<-read.delim("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

#find just the two days we need
pdays<-subset(energyCon,Date=="1/2/2007" | Date=="2/2/2007" )

#convert the character fields to the correct type
pdays$Date=as.POSIXct(paste(strptime(pdays$Date,format="%d/%m/%Y"),pdays$Time))
pdays$Sub_metering_1=as.numeric(pdays$Sub_metering_1)
pdays$Sub_metering_2=as.numeric(pdays$Sub_metering_2)
pdays$Sub_metering_3=as.numeric(pdays$Sub_metering_3)


#remove the large text file from memory
rm(energyCon)

#Create the  plot

with (pdays,plot(Date,Sub_metering_1,type="l",sub=NA,ylab="Energy sub metering",xlab=NA))
with(pdays,points(Date,Sub_metering_2,type="l",col="red"))
with(pdays,points(Date,Sub_metering_3,type="l",col="blue"))

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)


#Now Save as PNG 480X480 pixes
dev.copy(png,"Plot3.png",width = 480,height = 480,units = "px")
dev.off()