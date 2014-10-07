zipfile <- "exdata-data-household_power_consumption.zip"
unzip(zipfile)

txtfile <- "household_power_consumption.txt"

df <- read.table(txtfile, sep=";", header=T, stringsAsFactors = F, na.strings= "?")
file.remove(txtfile)
dffiltered <- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007")) 

dffiltered$DateTime <- strptime(paste(dffiltered$Date, dffiltered$Ti), "%d/%m/%Y %H:%M:%S")

dim <-  480
png("plot2.png", width=dim, height=dim)

title <- ""
xlab <- ""
ylab <- "Global Active Power (kilowatts)"
Sys.setlocale("LC_TIME", "C");

plot(dffiltered$DateTime, dffiltered$Global_active_power, type= "l",  main= title, xlab=xlab, ylab=ylab)

dev.off()

