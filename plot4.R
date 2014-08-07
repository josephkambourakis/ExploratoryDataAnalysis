#Read data file
household_power_consumption <- read.csv("C:/Users/kamboj/Desktop/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#Make a new datetime column
household_power_consumption$DT<-paste(household_power_consumption$Date, household_power_consumption$Time)

#Convert Time to Time from a Level
household_power_consumption$DT<-strptime(household_power_consumption$DT, format = "%d/%m/%Y %H:%M:%S")

#Limit Data to 2 days in February
household_power_consumption<-subset(household_power_consumption, DT >=as.POSIXct('2007-02-01 00:00:00')&DT <as.POSIXct('2007-02-03 00:00:00'))

#Remove Date and Time
household_power_consumption<-household_power_consumption[,3:10]

#Convert Global Active Power to a number from a level
household_power_consumption$Global_active_power=as.numeric(as.character(household_power_consumption$Global_active_power))

#Convert Global ReActive Power to a number from a level
household_power_consumption$Global_reactive_power=as.numeric(as.character(household_power_consumption$Global_reactive_power))

#Convert Voltage to a number from a level
household_power_consumption$Voltage=as.numeric(as.character(household_power_consumption$Voltage))

#Convert Global_intensity to a number from a level
household_power_consumption$Global_intensity=as.numeric(as.character(household_power_consumption$Global_intensity))

#Convert Voltage to a number from a level
household_power_consumption$Sub_metering_1=as.numeric(as.character(household_power_consumption$Sub_metering_1))
                                                                                                                                 
#Convert Global_intensity to a number from a level
household_power_consumption$Sub_metering_2=as.numeric(as.character(household_power_consumption$Sub_metering_2))
                                                                                                                                                                                                      
                                                                     
#Write to file
png(filename = 'plot4.png', width = 480, height = 480)

#Make 2x2 plot
par(mfrow = c(2,2))

#Plot 1
plot(household_power_consumption$Global_active_power, xaxt="n", ylab = "Global Active Power", xlab = "", type = 'l')
axis(1, at =c(1,nrow(household_power_consumption)/2,nrow(household_power_consumption)),labels = c("Thu", "Fri","Sat"))

#Plot 2
plot(household_power_consumption$Voltage, yaxt = "n", xaxt="n", ylab = "Voltage", xlab = "datetime", type = 'l')
axis(1, at =c(1,nrow(household_power_consumption)/2,nrow(household_power_consumption)),labels = c("Thu", "Fri","Sat"))
axis(2, at =c(234, 236, 238, 240, 242, 244, 246),labels = c("234","", "238","" ,"242","", "246"))

#Plot 3
plot(household_power_consumption$Sub_metering_1, xaxt="n", ylab = "Energy sub metering", xlab = "", type = 'l')
par(new=TRUE)
plot(household_power_consumption$Sub_metering_2, yaxt="n", xaxt = "n",ylab = "Energy sub metering", xlab = "", type = 'l', col = 2, ylim = c(0,40))
par(new=TRUE)
plot(household_power_consumption$Sub_metering_3, yaxt="n",xaxt="n", ylab = "Energy sub metering", xlab = "", type = 'l', col = 4,ylim = c(0,40))

axis(1, at =c(1,nrow(household_power_consumption)/2,nrow(household_power_consumption)),labels = c("Thu", "Fri","Sat"))
legend("topright", cex = .9, colnames(household_power_consumption[5:7]), lty = 1, col = c(1, 2, 4), bty = "n",box.col = "white")

#Plot 4
plot(household_power_consumption$Global_reactive_power, xaxt="n", ylab = "Global_reactive_power",xlab = "datetime", type = 'l')
axis(1, at =c(1,nrow(household_power_consumption)/2,nrow(household_power_consumption)),labels = c("Thu", "Fri","Sat"))



dev.off()