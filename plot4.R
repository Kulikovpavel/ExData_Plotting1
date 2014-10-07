zipfile <- "exdata-data-household_power_consumption.zip"
unzip(zipfile)

txtfile <- "household_power_consumption.txt"

df <- read.table(txtfile, sep=";", header=T, stringsAsFactors = F, na.strings= "?")
file.remove(txtfile)
dffiltered <- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007")) 

dffiltered$DateTime <- strptime(paste(dffiltered$Date, dffiltered$Ti), "%d/%m/%Y %H:%M:%S")

dim <-  480
png("plot4.png", width=dim, height=dim)

Sys.setlocale("LC_TIME", "C");


# divide the plot device into four subplots
par(mfrow=c(2,2)) # 4 plots
# top-left
title <- ""
xlab <- ""
ylab <- "Global Active Power (kilowatts)"
plot(dffiltered$DateTime, dffiltered$Global_active_power, type= "l", main=title, xlab=xlab, ylab=ylab) 

# top-right
title <- ""
xlab <- "datetime"
ylab <- "Voltage"
plot(dffiltered$DateTime, dffiltered$Voltage, type="l", main=title, xlab=xlab, ylab=ylab)   

# bottom-left
title <- ""
xlab <- ""
ylab <- "Energy sub metering"
plot(dffiltered$DateTime, dffiltered$Sub_metering_1, type="l", main= title, xlab=xlab, ylab=ylab)
lines(dffiltered$DateTime, dffiltered$Sub_metering_2, type="l", col="red")
lines(dffiltered$DateTime, dffiltered$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# bottom-right
title <- ""
xlab <- "datetime"
ylab <- "Global_reactive_power"
plot(dffiltered$DateTime, dffiltered$Global_reactive_power, type="l", main=title, xlab=xlab, ylab=ylab)  

dev.off()

