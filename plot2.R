library(dplyr)

hpc = read.csv('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
Fhpc = hpc %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(datetime = as.POSIXct(paste(Date, Time), format = '%d/%m/%Y %H:%M:%S'))

png("plot2.png", width = 480, height = 480)
with(Fhpc,
     plot(datetime, Global_active_power, type = 'l',
          xlab = '', ylab = 'Global Active Power (kilowatts)')
)
dev.off()