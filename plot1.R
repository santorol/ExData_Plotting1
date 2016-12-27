#Load the data
energyCon<-read.delim("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
#find just the two days we need
pdays<-subset(energyCon,Date=="1/2/2007" | Date=="2/2/2007" )
#remove the large text file from memory
rm(energyCon)
#convert the character fields to the correct type
#pdays$Date=as.Date(strptime(pdays$Date,format="%d/%m/%Y"))
#pdays$Time=as.POSIXct(pdays$Time,format="%H:%M:%S")
pdays$Global_active_power=as.numeric(pdays$Global_active_power)
#Create the first plot)
hist(pdays$Global_active_power,freq = TRUE,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")
#Now Save as PNG 480X480 pixes

dev.copy(png,"Plot1.png",width = 480,height = 480,units = "px")
dev.off()