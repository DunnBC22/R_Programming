library(tidyverse)
library(dplyr)

library(TTR)

setwd('~/Desktop/FAANG Historical Stock Price Data/')

data <- read.csv(file="Apple_SP.csv")

weekly.vol.data <- ts(data$Volume,start=c(2016,4),frequency=52)

jpeg(file="R/Apple_stock_time_series_volume_base.jpeg", width = 750,height = 270)

data.for.plotting <- data.frame(data$Date, weekly.vol.data)

tsa.plot <- ggplot(data.for.plotting, aes(x=as.Date(data$Date),y=SMA_vol)) +
  geom_line() +
  labs(title = "Time Series Analysis (Apple)", x="") +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(name="Volume (x 1,000,000)", labels = scales::number_format(scale=1/1000000))

tsa.plot

dev.off()

