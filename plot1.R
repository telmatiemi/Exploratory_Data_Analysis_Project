# Directory containing household_power_consumption.txt file
dir <- "C:/Users/Telma/Documents/Data_Science_Coursera/Exploratory_Analysis/Week1/exdata-data-household_power_consumption/household_power_consumption.txt"

# Reading file in directory 'dir' to a variable 'table'
table <- read.table(dir, header = TRUE, sep = ";", dec = ".")

# Converting Global_reactive_power column to datatype numeric.
Global_active_power <-  as.numeric(table[,3])

hist(Global_active_power, col = "red", breaks = 15, main = "Global Active Power", xlab = "Global Active Power (in kilowatts)", ylim = c(0, 1000000))

dev.copy(png, file = "plot1.png")

dev.off()