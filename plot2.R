#Read data file
household_power_consumption <- read.csv("C:/Users/kamboj/Desktop/Exploratory Data Analysis/household_power_consumption.txt", sep=";")
household_power_consumption<-household_power_consumption[,c(1, 2,3)]

#Make a new datetime column
household_power_consumption$DT<-paste(household_power_consumption$Date, household_power_consumption$Time)

#Convert Time to Time from a Level
household_power_consumption$DT<-strptime(household_power_consumption$DT, format = "%d/%m/%Y %H:%M:%S")

#Limit Data to 2 days in February
household_power_consumption1<-subset(household_power_consumption, DT >=as.POSIXct('2007-02-01 00:00:00')&DT <as.POSIXct('2007-02-03 00:00:00'))

#Convert Global Active Power to a number from a level
household_power_consumption1$Global_active_power=as.numeric(as.character(household_power_consumption1$Global_active_power))

head(household_power_consumption1)
a<-ts(household_power_consumption1$Global_active_power)


#Adjust graphical parameters
par(bg = "white", ps = 11)

#Plot
plot(a, xaxt="n", ylab = "Global Active Power (kilowatts)", xlab = "", type = 'l')
axis(1, at =c(1,nrow(household_power_consumption1)/2,nrow(household_power_consumption1)),labels = c("Thu", "Fri","Sat"))

#Save plot
dev.copy(png,'plot2.png')
dev.off()
