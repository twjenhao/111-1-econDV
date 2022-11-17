library(readxl)
library(dplyr)
library(targets)
library(ggplot2)
library(econDV2)
data9hw1 <- read.csv("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week9/econDV2作業1/工作表 2-表格 1.csv")
plot$ggplot <- ggplot(data = plot$data)
plot$geoms <- list(geom_tile(aes(x=year,y=Product,fill=Export)))
plot$themes <- list(theme(
  axis.ticks.y=element_blank()),
  scale_x_continuous(expand=c(0,0)))

plot$ggplot+plot$geoms+plot$themes+theme(legend.position = "none")
