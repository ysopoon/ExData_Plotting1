plot4 <- function(directory = "household_power_consumption.txt"){
    # read the data from the text file
    data <- read.csv(directory, sep = ";")
    
    # set the classes for the Date and Time columns 
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    # reduce the data with only the Date 2007-02-01 and 2007-02-02
    data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
    
    data$Date <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
    
    # transform the columns to numeric class
    for(i in 3:9){
        data[,i] <- as.numeric(as.character(data[,i]))
    } #end of for
    
    # plot the graph
    par(mfrow = c(2, 2))
    # plot the topleft
    plot(data$Date, data$Global_active_power, type = "l",
         xlab = "", ylab = "Global Active Power (kilowatts)")
    # plot the topright
    plot(data$Date, data$Voltage, type = "l",
         xlab = "detetime", ylab = "Voltage (volt)")
    # plot the bottomleft
    plot(data$Date, data$Sub_metering_1, type = "l", col = "black",
         xlab = "", ylab = "Enery sub metering")
    lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
    lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = "-", col = c("black", "red", "blue"), cex = 0.5,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # plot the bottomright
    plot(data$Date, data$Global_reactive_power, type = "l",
        xlab = "detetime", ylab = "Global reactive power(kilowatts)")

    # store the plot into a png file
    dev.copy(png, file = "plot4.png")
    dev.off()
}