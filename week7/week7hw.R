googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="Sheet10"
) -> data7

library(readxl)
dataset <- read_excel("/Users/liurenhao/Documents/GitHub/111-1-econDV/week7/Exercise Data.xlsx",
                      sheet="Sheet10"
                      ) -> data7_1

#https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/summary-manip.html  

#<問一>標題出現頻率如何更改(32)
#<問二>可不可以從x數值資料找到切割點(37)

tidyr::pivot_longer(
  data = data7,
  cols = 2:4, #以第一個column當觀測值基準，把後面資料壓成下面兩行
  names_to = "country",
  values_to = "data"
) -> data7sort

class(data7sort$year) #轉成character才不會有間隔，如果間斷資料就會有空隙，如果是連續資料就會沒空隙

ggplot(data = data7sort)+
  geom_tile(
    mapping =aes(x=year,y=country,fill=data),
    colour = "grey"
    )+
  theme(
    axis.text.x = element_text(
      angle=90,
      hjust = 1
      #<問一>標題出現頻率如何更改？
    ))+
  annotate("rect", #矩形，要畫什麼圖型放在這邊，矩形圓形等等
           xmin = 22, xmax = 29, #<問二>可不可以從x數值資料找到切割點
           ymin = 0.5, ymax = 3.5,
           alpha = .2,colour = "pink",
           fill="pink")+
  annotate("rect", 
           xmin = 52, xmax = 55, 
           ymin = 0.5, ymax = 3.5,
           alpha = .1,colour = "pink",
           fill="pink")
#geom_segment(aes(x = 1971, y = 0, xend = 1978, yend = 1)
#geom_vline(xintercept = 21,xintercept =30)
  
ggdash()




