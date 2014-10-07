zipfile <- "exdata-data-household_power_consumption.zip"
unzip(zipfile)

txtfile <- "household_power_consumption.txt"

df <- read.table(txtfile, sep=";", header=T, stringsAsFactors = F, na.strings= "?")
file.remove(txtfile)
dffiltered <- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007")) 

dffiltered$DateTime <- strptime(paste(dffiltered$Date, dffiltered$Ti), "%d/%m/%Y %H:%M:%S")

dim <-  480
png("plot3.png", width=dim, height=dim)

title <- ""
xlab <- ""
ylab <- "Energy sub metering"
Sys.setlocale("LC_TIME", "C");



plot(dffiltered$DateTime, dffiltered$Sub_metering_1, type="l", main= title, xlab=xlab, ylab=ylab)

lines(dffiltered$DateTime, dffiltered$Sub_metering_2, type="l", col="red")

lines(dffiltered$DateTime, dffiltered$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()
