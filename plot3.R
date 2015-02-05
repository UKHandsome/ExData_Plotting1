#Read data file.
hpc <- read.table('household_power_consumption.txt',sep=";",header=TRUE, na = "?")
#Convert date
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
#Select 2 days data
dSet<-subset(hpc,Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
#Convert it to numeric
dSet$Global_active_power<-as.numeric(dSet$Global_active_power)
#Combile date and time and store result in "Date" column.
dSet$Date<-strptime(paste(dSet$Date,dSet$Time),"%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",     width = 480, height = 480,    units = "px", bg = "transparent")
plot(dSet$Date, dSet$Sub_metering_1,  type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(dSet$Date, dSet$Sub_metering_2, col = "red")
lines(dSet$Date, dSet$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()

