library(dplyr)

hpc = read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
Fhpc = hpc %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(datetime = as.POSIXct(paste(Date, Time), format = '%d/%m/%Y %H:%M:%S'))

png("plot1.png", width = 480, height = 480)
with(Fhpc,
    hist(Global_active_power, col = 'red', main = 'Global Active Power',
         xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
)
dev.off()