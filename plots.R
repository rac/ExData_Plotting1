if (!file.exists("household_power_consumption.txt")) {
	dest <- "hpc.zip"
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=dest, method="curl")
	unzip(dest)
}

data <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2879, na.strings="?")

data$Date <- strptime(paste(data$V1,data$V2), "%d/%m/%Y %H:%M:%S")

plot1 <- function() {
	hist(
		data$V3,
		main='Global Active Power',
		xlab='Global Active Power (kilowatts)',
		col='red'
	)
}

plot2 <- function() {
	plot(
		data$Date,
		data$V3,
		ylab='Global Active Power (kilowatts)',
		xlab='',
		type='l'
	)
}

plot3 <- function() {
	plot(
		data$Date,
		data$V7,
		type='l',
		xlab='',
		ylab='Energy sub metering'
	)
	lines(
		data$Date,
		data$V8,
		col='red'
	)
	lines(
		data$Date,
		data$V9,
		col='blue'
	)
	legend(
		'topright',
		legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
		col=c('black', 'red', 'blue'),
		lty='solid'
	) 
}

plot4 <- function() {
	plot2()

	plot(
		data$Date,
		data$V5,
		xlab='datetime',
		ylab='Voltage',
		type='l'
	)

	plot3()

	plot(
		data$Date,
		data$V4,
		xlab='datetime',
		ylab='Global_reactive_power',
		type='l'
	)
}
