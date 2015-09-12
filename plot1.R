
# read dataset
df<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdf<- df[df$Date %in% c("1/2/2007","2/2/2007") ,] # subset dataset
gap<- as.numeric(subdf$Global_active_power) # convert into numeric
# build graph and pass paremeters
png("plot1.png", width=480, height=480) 
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

