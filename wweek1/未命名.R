library(ggplot2)
library(readr)
library(dplyr)
library(ggrepel)
library(econDV2)
if(!require(showtext)) install.packages("showtext")
showtext::showtext_auto()

datww1 <- read.csv("/Users/liurenhao/Documents/TaipeiuniversityNote/EconmicVisual/111-1-econDV/wweek1/台電系統歷年裝置容量分四類(71-110).csv")

datww1[,1] +1911 -> datww1[,1]

datww1w <- datww1[,1:2]
datww1w [,2] <-as.numeric(datww1[,2])
colnames(datww1w) <- c('year','抽蓄水力')

datww1n <- datww1[,1:2]
datww1n[,2] <- datww1[,3]
as.numeric(datww1n[,2] )
colnames(datww1n) <- c('year','核能')

gg2 = list()
gg2$plot <- ggplot()
gg2$geom <- list(
  geom_line(data=datww1w,aes(x=year,y=抽蓄水力,color=抽蓄水力)),
  geom_line(data=datww1n,aes(x=year,y=核能,color=核能))
  )
gg2$scale <- list(
  scale_color_gradient2(
    limit=c(0,2000),
    low = "white",
    high="blue"
  )
)
  
  
gg2$plot+gg2$geom+gg2$scale
