#Set working directory
setwd("C:/Users/kamboj/Desktop/Exploratory Data Analysis")

#Read data file
household_power_consumption <- read.csv("C:/Users/kamboj/Desktop/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

household_power_consumption<-household_power_consumption[,c(1,2,7:9)]

#Make a new datetime column
household_power_consumption$DT<-paste(household_power_consumption$Date, household_power_consumption$Time)

#Convert Time to Time from a Level
household_power_consumption$DT<-strptime(household_power_consumption$DT, format = "%d/%m/%Y %H:%M:%S")

#Limit Data to 2 days in February
household_power_consumption1<-subset(household_power_consumption, DT >=as.POSIXct('2007-02-01 00:00:00')&DT <as.POSIXct('2007-02-03 00:00:00'))

#Convert Global Active Power to a number from a level
household_power_consumption1$Sub_metering_1=as.numeric(as.character(household_power_consumption1$Sub_metering_1))
household_power_consumption1$Sub_metering_2=as.numeric(as.character(household_power_consumption1$Sub_metering_2))
household_power_consumption1$Sub_metering_3=as.numeric(as.character(household_power_consumption1$Sub_metering_3))

a<-ts(household_power_consumption1$Sub_metering_1)
b<-ts(household_power_consumption1$Sub_metering_2)
c<-ts(household_power_consumption1$Sub_metering_3)
#Adjust graphical parameters
par(bg = "white", ps = 11)

png(filename = 'plot3.png', width = 480, height = 480)


#Plot
plot(a, xaxt="n", ylab = "Energy sub metering", xlab = "", type = 'l')
par(new=TRUE)
plot(b, yaxt="n", xaxt = "n",ylab = "Energy sub metering", xlab = "", type = 'l', col = 2, ylim = c(0,40))
par(new=TRUE)
plot(c, yaxt="n",xaxt="n", ylab = "Energy sub metering", xlab = "", type = 'l', col = 4,ylim = c(0,40))

axis(1, at =c(1,nrow(household_power_consumption1)/2,nrow(household_power_consumption1)),labels = c("Thu", "Fri","Sat"))
legend("topright", colnames(household_power_consumption1[3:5]), lty = 1, col = c(1, 2, 4), merge = T)
dev.off()

