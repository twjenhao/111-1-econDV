library(ggplot2)
library(dplyr)
library(lubridate)
dat2 <- read.csv("/Users/liurenhao/Documents/TaipeiuniversityNote/EconmicVisual/111-1-econDV/wweek2/1_city_202211.csv")

for (i in 1:1909) {
  dat2[i,1] <- paste0(gsub("年","",gsub("月","01",dat2[i,1])))
  }


dat2[c(-3,-5,-7,-9,-11,-12)] -> dat2_2
data2_2 <- dat2_2[dat2_2$city !="合計",]
tidyr :: pivot_longer(
  data = dat2_2,
  cols = 3:6, 
  names_to = "購電單位",values_to = "購電佔比") -> dat2_3
dat2_3 <- dat2_3[dat2_3$city != "合計",]

dat2_3$year[1:88]

dat2_3_202211 <- dat2_3[1:88,]
dat2_3_202210 <- dat2_3[89:176,]

g2 <- list()
g2$plot <- ggplot(data=dat2_3_202211)
g2$geom <- list(
  geom_point(aes(x=購電單位,y=city,color=購電佔比))
             )
g2$scale <- list(
  scale_color_continuous(
    limit = c(0,1),
    low = "white",
    high="#900C3F"),
  scale_y_discrete(
    limit = c('台北市','金門縣','連江縣','嘉義市','澎湖縣','基隆市','台東縣',
              '屏東縣','新北市','南投縣','嘉義縣','雲林縣','彰化縣',
              '花蓮縣','宜蘭縣',
              '苗栗縣','桃園市','台中市','高雄市','台南市','新竹縣','新竹市')
  )
)

# guide = "none")
g2$theme <-list(
  ylab(NULL),
  # theme(panel.background=element_rect(fill='grey',color="#000000",col='red')),
  # theme(panel.grid.major=element_line(colour='black',linetype="solid")),
  )


g2$plot+g2$geom+g2$theme+g2$scale

