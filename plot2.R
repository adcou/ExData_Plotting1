library(lubridate)
library(dplyr)
library(tidyr)
library(stringr)
library(tidyr)

setwd("./ExData_Plotting1")

df <- as_tibble(read.delim(file = "./data input/household_power_consumption.txt", sep=";", dec = ".", na.strings = c("?"),colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),stringsAsFactors = F))
df$datetime <- str_c(df$Date, df$Time, sep = " ")
df$datetime <- dmy_hms(df$datetime)


dfsub <- subset(df,df$datetime>=ymd("2007-02-01") & df$datetime<ymd("2007-02-03")) #selection du 2007-02-01 au 2007-02-02 inclus

png(file="./results/plot2.png")
plot(dfsub$datetime,dfsub$Global_active_power, type="l", ylab = "Global Active Power (killowatts)", xlab="")
dev.off()