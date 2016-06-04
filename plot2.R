# household_power_consumption.txt
arq <- "household_power_consumption.txt"

# Reading file as table
tab <- read.table(arq, header = TRUE, sep = ";", na.strings = "?")

#Filtering by Date
ini_date <- strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S")
end_date <- strptime("02/02/2007 23:59:59","%d/%m/%Y %H:%M:%S")

# Including column Date_Time to table tab
tab$Date_Time <- strptime(paste(tab$Date, tab$Time), "%d/%m/%Y %H:%M:%S")

#Filtered table
fil_tab <- subset(tab, Date_Time >= ini_date & Date_Time <= end_date)

# Converting Global_reactive_power column to datatype numeric.
fil_tab$Global_active_power <-  as.numeric(fil_tab$Global_active_power)

# Generating graphic
png(filename = "plot2.png", width = 480, height = 480)

plot(fil_tab$Date_Time, fil_tab$Global_active_power, type = "l"
     , xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()