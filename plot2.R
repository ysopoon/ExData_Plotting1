plot2 <- function(directory = "household_power_consumption.txt"){
    # read the data from the text file
    data <- read.csv(directory, sep = ";")
    
    # set the classes for the Date and Time columns 
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    # reduce the data with only the Date 2007-02-01 and 2007-02-02
    data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
    
    data$Date <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

    # transform the column to numeric class
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    
    # plot the graph
    plot(data$Date, data$Global_active_power, type = "l",
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    # store the plot into a png file
    dev.copy(png, file = "plot2.png")
    dev.off()
}