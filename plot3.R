library(dplyr)

hpc = read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
Fhpc = hpc %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(datetime = as.POSIXct(paste(Date, Time), format = '%d/%m/%Y %H:%M:%S'))

png("plot3.png", width = 480, height = 480)
with(Fhpc,{
    plot(datetime, Sub_metering_1, type = 'l',
         col = 'black', xlab = '', ylab = 'Energy sub metering')
    points(datetime, Sub_metering_2, type = 'l', col = 'red')
    points(datetime, Sub_metering_3, type = 'l', col = 'blue')
    legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
           col = c('black','red','blue'), lwd = '1')
})
dev.off()