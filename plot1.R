zipfile <- "exdata-data-household_power_consumption.zip"
unzip(zipfile)

txtfile <- "household_power_consumption.txt"

df <- read.table(txtfile, sep=";", header=T, stringsAsFactors = F, na.strings= "?")
file.remove(txtfile)
dffiltered <- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007")) 

dim <-  480
png("plot1.png", width=dim, height=dim)

title <- "Global Active Power"
xlab <- "Global Active Power (kilowatts)"
ylab <- "Frequency"
hist(dffiltered$Global_active_power, col= "red",  main= title, xlab=xlab, ylab=ylab)

dev.off()



