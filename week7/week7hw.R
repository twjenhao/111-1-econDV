googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="Sheet10"
) -> data7

library(readxl)
dataset <- read_excel("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week7/Exercise Data.xlsx",
                      sheet="Sheet10"
                      ) -> data7

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
  







dataset <- read_excel("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week7/Exercise Data.xlsx",
                      sheet="Sheet10",col_types = c("numeric","numeric", "numeric", "numeric")
) -> data7

#https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/summary-manip.html  

#<問一>標題出現頻率如何更改(32)
#<問二>可不可以從x數值資料找到切割點(37)

tidyr::pivot_longer(
  data = data7,
  cols = 2:4, #以第一個column當觀測值基準，把後面資料壓成下面兩行
  names_to = "country",
  values_to = "data"
) |>mutate(
  year = as.numeric(year),
  y = dplyr::case_when(country == "country A" ~ 0.5, country == "country B" ~ 1.5, country == "country C" ~ 2.5)
) -> data7sort1

class(data7sort1$year)


plt=Plot()
plt$ggplot = ggplot(data=data7sort1)
plt$geom = 
  geom_tile(
    aes(
      x=year, y=country,
      fill=data
    ),
    width=1, height=1
  )
# in ggplot, categorical values are treated as integer starting from 1
# to cover country A, B, C, ymin and ymax must cover 1, 2, 3
# to cover country C, ymin and ymax must cover 3
plt$annotation = 
  geom_rect(
    data=data.frame(
      xmin=c(1971, 2001)-0.5, xmax=c(1978, 2004)+0.5, ymin=c(0.5, 2.5), ymax=c(3.5, 3.5)
    ),
    mapping=aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
    fill="transparent", linetype="solid", color="black"
  )

plt$ggplot+plt$geom


# rename fill variable, and define na value color
plt$scale = scale_fill_continuous(name="Changes in Life Expectancy", na.value = "transparent")
plt$others = list(
  # expand makes axis touch down; limits defines the sequence of presentation as levels can do
  scale_y_discrete(expand=c(0,0), position="right",limits=c("country C", "country B", "country A")),
  # breaks defines what should show on the axis
  scale_x_continuous(expand=c(0,0), breaks = seq(1960,2020, by=10) ),
  theme(
    legend.position="top",
    axis.line.y=element_blank(),
    axis.ticks.y=element_blank()
  ),
  # no labels in x and y axes
  xlab(NULL),ylab(NULL)
)
# Due to the new sequence of country presentation, we need to change ymin and ymax setting
plt$annotation = list(
  geom_rect(
    data=data.frame(
      xmin=c(1971, 2001)-0.5, xmax=c(1978, 2004)+0.5, ymin=c(0.5, 0.5), ymax=c(3.5, 1.5)
    ),
    mapping=aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
    fill="transparent", linetype="solid", color="black"
  )
)

plt$ggplot+plt$geom+plt$scale+plt$others+plt$annotation


