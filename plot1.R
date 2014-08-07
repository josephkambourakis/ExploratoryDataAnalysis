#Read data file
household_power_consumption <- read.csv("C:/Users/kamboj/Desktop/Exploratory Data Analysis/household_power_consumption.txt", sep=";")
#Recode Dates
household_power_consumption$Date<-as.Date(household_power_consumption$Date,'%d/%m/%Y')

#Limit Data to 2 days in February
household_power_consumption<-subset(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02" )

#Convert Global Active Power to a number from a level
household_power_consumption$Global_active_power=as.numeric(as.character(household_power_consumption$Global_active_power))

#Adjust graphical parameters
par(bg = "transparent", ps = 12)

#Plot Histogram
hist(xaxt = "n",household_power_consumption$Global_active_power, col = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
axis(1, at=c(0, 2, 4, 6), labels = c(0, 2, 4, 6))

#Save plot
dev.copy(png,'plot1.png')
dev.off()
