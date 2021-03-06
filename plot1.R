plot1 <- function(){
  ## This first section sets up a data frame with the relevant data.
  ## You need "household_power_consumption.txt" in the working directory.
  hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
  hpc$ptime<-strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S")
  hpc$pdate<-as.Date(hpc$ptime)
  hpc<-subset(hpc, pdate==as.Date("2007-02-01")|pdate==as.Date("2007-02-02"))
  
  ## This section creates the plot PNG
  png(filename="Plot1.png", width=480, height=480)  
  hist(as.numeric(hpc$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}