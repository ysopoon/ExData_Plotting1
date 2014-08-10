plot1 <- function(directory = "household_power_consumption.txt"){
    # read the data from the text file
    data <- read.csv(directory, sep = ";")
    
    # set the classes for the Date and Time columns 
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    # reduce the data with only the Date 2007-02-01 and 2007-02-02
    data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
    
    # transform the column to numeric class
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    
    # plot the histogram 
    hist((data$Global_active_power), col = "red", 
         xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
    
    # store the histogram as a png file
    dev.copy(png, file = "plot1.png")
    dev.off()
}