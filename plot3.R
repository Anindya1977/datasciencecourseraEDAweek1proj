# read dataset
df<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdf<- df[df$Date %in% c("1/2/2007","2/2/2007") ,] # subset dataset
gap<- as.numeric(subdf$Global_active_power) # convert into numeric
# convert into date
dt <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subdf$Sub_metering_1)  # convert into numeric
sm2 <- as.numeric(subdf$Sub_metering_2)  # convert into numeric
sm3 <- as.numeric(subdf$Sub_metering_3)  # convert into numeric

# build graph and pass paremeters
png("plot3.png", width=480, height=480)
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()