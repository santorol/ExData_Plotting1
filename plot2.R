#Load the data
energyCon<-read.delim("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)

#find just the two days we need
pdays<-subset(energyCon,Date=="1/2/2007" | Date=="2/2/2007" )
#convert the character fields to the correct type
pdays$Date=as.POSIXct(paste(strptime(pdays$Date,format="%d/%m/%Y"),pdays$Time))

#remove the large text file from memory
rm(energyCon)

#Create the  plot
plot(pdays$Date,pdays$Global_active_power,ylab="Global Active Power (kilowatts)", type="l",xlab = "")


#Now Save as PNG 480X480 pixes
dev.copy(png,"Plot2.png",width = 480,height = 480,units = "px")
dev.off()