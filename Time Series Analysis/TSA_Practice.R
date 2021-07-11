library(tidyverse)
library(dplyr)

library(TTR)

setwd('~/Desktop/FAANG Historical Stock Price Data/')

data <- read.csv(file="Apple_SP.csv")

df <- data.frame(data$Volume)

head(df)
print(nrow(df))
print(ncol(df))

weekly.vol.data <- ts(df,start=c(2016,4),frequency=52)

jpeg(file="R/Apple_stock_time_series_volume.jpeg", width = 750,height = 270)

plot(weekly.vol.data)

dev.off()