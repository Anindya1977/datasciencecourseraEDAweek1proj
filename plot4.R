# read dataset
df<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdf<- df[df$Date %in% c("1/2/2007","2/2/2007") ,] # subset dataset
gap<- as.numeric(subdf$Global_active_power) # convert into numeric
rgap <- as.numeric(subdf$Global_reactive_power)# convert into numeric
vg <- as.numeric(subdf$Voltage) # convert into numeric
dt <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # convert into date 
sm1 <- as.numeric(subdf$Sub_metering_1)  # convert into numeric
sm2 <- as.numeric(subdf$Sub_metering_2)  # convert into numeric
sm3 <- as.numeric(subdf$Sub_metering_3)  # convert into numeric

# build graph and pass parameters
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dt, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, vg, type="l", xlab="datetime", ylab="Voltage")
plot(dt,sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt,sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dt,rgap, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
