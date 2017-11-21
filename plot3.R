plot3 <- function(){
  ## This first section sets up a data frame with the relevant data.
  ## You need "household_power_consumption.txt" in the working directory.
  hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
  hpc$ptime<-strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S")
  hpc$pdate<-as.Date(hpc$ptime)
  hpc<-subset(hpc, pdate==as.Date("2007-02-01")|pdate==as.Date("2007-02-02"))
  
  ## This section creates the plot PNG
  png(filename="Plot3.png", width=480, height=480)  
  plot(hpc$ptime,as.numeric(hpc$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
  lines(hpc$ptime,as.numeric(hpc$Sub_metering_1), type="l")
  lines(hpc$ptime,as.numeric(hpc$Sub_metering_2), type="l", col="red")
  lines(hpc$ptime,as.numeric(hpc$Sub_metering_3), type="l", col="blue")
  legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
  dev.off()
}