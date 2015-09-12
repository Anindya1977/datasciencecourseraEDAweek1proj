# read dataset
df<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdf<- df[df$Date %in% c("1/2/2007","2/2/2007") ,] # subset dataset
gap<- as.numeric(subdf$Global_active_power) # convert into numeric
dt <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # convert into date
# build graph and pass paremeters
png("plot2.png", width=480, height=480)
plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()