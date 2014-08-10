plot3 <- function(directory = "household_power_consumption.txt"){
    # read the data from the text file
    data <- read.csv(directory, sep = ";")
    
    # set the classes for the Date and Time columns 
    data$Date <- as.Date(data$Date, "%d/%m/%Y")

    # reduce the data with only the Date 2007-02-01 and 2007-02-02
    data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
    
    data$Date <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    # transform the columns to numeric class
    data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
    
    # plot the graph
    plot(data$Date, data$Sub_metering_1, type = "l", col = "black",
         xlab = "", ylab = "Enery sub metering")
    lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
    lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = "--", col = c("black", "red", "blue"), bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # store the plot into a png file
    dev.copy(png, file = "plot3.png")
    dev.off()
}
