library(ggplot2)
library(readr)
library(dplyr)
library(ggrepel)
library(econDV2)
if(!require(showtext)) install.packages("showtext")
showtext::showtext_auto()

datww1 <- read.csv("/Users/liurenhao/Documents/TaipeiuniversityNote/EconmicVisual/111-1-econDV/wweek1/台電系統歷年裝置容量分四類(71-110).csv")


tidyr :: pivot_longer(
  data = datww1,
  cols = 2:5, 
  names_to = "發電方式",values_to = "發電量") -> datww1_2

datww1_2 <- datww1_2 %>% mutate('年' = `年`+1911)
ggplot1=list()
ggplot1$plot <- ggplot(data = datww1_2)
ggplot1$geom <- geom_point(aes(x=發電方式,y=發電量,color=年)) 
ggplot1$scale <- scale_colour_continuous(
  limit = c(1982,2021),
  low = "white",
  high="#900C3F")
ggplot1$plot+ggplot1$geom+ggplot1$scale

datww1[,1:2] %>% mutate("年" = 年+1911) -> datawater
datawater %>% mutate("年"=as.character(datawater[,1]))
ggplotwater = list()
ggplotwater$ggplot <- ggplot(data=datawater)
ggplotwater$geom <- geom_line(aes(x=年, y=抽蓄水力))
ggplotwater$ggplot+ggplotwater$geom

datww1[,1:3] %>% mutate("年" = 年+1911) -> datanu
datanu[,-2] -> datanu
datanu %>% mutate("年"=as.character(datawater[,1]))
ggplotnu = list()
ggplotnu$ggplot <- ggplot(data=datanu)
ggplotnu$geom <- geom_line(aes(x=年, y=核能))
ggplotnu$ggplot+ggplotnu$geom


datww1[,1:4] %>% mutate("年" = 年+1911) -> datafire
datafire[,-2:-3] -> datafire
datafire %>% mutate("年"=as.character(datawater[,1]))
ggplotfire = list()
ggplotfire$ggplot <- ggplot(data=datafire)
ggplotfire$geom <- geom_line(aes(x=年, y= 火力))
ggplotfire$ggplot+ggplotfire$geom



datww1 %>% mutate("年" = 1911+年) -> dataoverall
tidyr::pivot_longer(
  data = dataoverall,
  cols = 2:5,
  names_to="發電方式",values_to = '裝置容量') ->dataoverall_1
dataoverall[73:1000,] -> dataoverall_2

ggplotline = list()
ggplotline$ggplot <- ggplot(data=dataoverall_2)
ggplotline$geom <- geom_line(aes(x=年, y=裝置容量,color=發電方式),linewidth=1) 
ggplotline$others <- list(geom_text_repel(aes(x=年, y=裝置容量,label=發電方式,color=發電方式), data = dataoverall[157:160,1:3], size = 3),
  theme(legend.position = "none"),
  xlab(NULL))

ggplotline$text <- geom_text(aes(x=年, y=裝置容量))

ggplotline$explain = list(
  labs(
    title="台電系統裝置容量",
    subtitle="單位：萬瓩",
    caption="資料來源：台灣電力股份有限公司")
)

ggplotline$scale <- list(scale_color_manual(
  limits = c('抽蓄水力', '核能', '火力', '再生能源'),
  values = c("#6FB1E7","#7EBA68","#ED90A4", "8DCBE6")),
  scale_x_continuous(
    expand=c(0,0)),
  scale_y_continuous(
    expand=c(0,0))
)
ggplotline$theme <- theme(plot.title=element_text(face='bold',size=20))


# theme(plot.title=element_text(face="bold",size=20,family = "A",color = "firebrick4",hjust = 0.5))
# manual:手動

ggplotline$ggplot+ggplotline$geom+ggplotline$scale +ggplotline$others + ggplotline$explain +ggplotline$theme

ggdash()







