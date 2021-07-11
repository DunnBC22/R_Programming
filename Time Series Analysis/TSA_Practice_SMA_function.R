library(tidyverse)
library(dplyr)
library(TTR)

setwd('~/Desktop/FAANG Historical Stock Price Data/')

data <- read.csv(file="Apple_SP.csv")

jpeg(file="R/Apple_stock_time_series_volume_SMA.jpeg", width = 750,height = 300)

# Smoothing with a moving average of 10
data$VolumeSMA <- SMA(data$Volume, n=10)
data$Date <- as.Date(data$Date)

ggplot(data, aes(x=Date)) +
  geom_line(aes(y=VolumeSMA), color="red", show.legend = TRUE) +
  geom_line(aes(y=Volume), color="blue", alpha=.35, show.legend = TRUE) +
  labs(title = "Time Series Analysis Smoothed over 10 (Apple)", x="") +
  scale_x_date(date_breaks = "6 month", date_labels = "%m %Y") +
  theme_bw() +
  theme(
    plot.margin = unit(c(.5, .8, .1, .5), unit='cm'),
    panel.border= element_rect(linetype = 'solid', color= 'darkblue', size=2.5),
    plot.background= element_rect(fill='#87ceeb'),
    plot.title=element_text(hjust=0.5, face='bold', size=18, margin=margin(b=.3, unit='cm')),
    axis.title.y=element_text(face='bold', margin=margin(r=.5, unit='cm')),
    axis.text = element_text(face='bold', color='darkblue', angle=20),
    axis.text.x = element_text(margin = margin(t=.3, unit='cm'))
  ) +
  scale_y_continuous(
    name="Volume (in millions)", 
    labels = scales::number_format(scale=1/1000000))

dev.off()
