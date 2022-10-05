data0=data.frame(
  x=c(1,2,3,4),
  y=c(2,3,6,7),
  alpha_stroke=c(1,2,1,2)
)
split(data0,data0$alpha_stroke) ->data_split
data_split
#data cleaning /manipulation
data1= data.frame(
  x=c(1,3),
  y=c(2,6),
  alpha_stroke=c(1,1)
)
data2= data.frame(
  x=c(2,4),
  y=c(3,7),
  alpha_stroke=c(1,1)
)
ggplot(
  data=data0,
  mapping= aes(x=x,y=y) 
)+
  geom_point(
    mapping= aes(
      stroke= alpha_stroke,
      alpha= alpha_stroke),
      fill="blue",
      size=5,
      color="green",
      shape=21
    )
# https://ggplot2.tidyverse.org/reference/geom_point.html?q=geom%20point#null

#color (線框顏色): constant
#stroke (線框粗細): constant
#fill (內部塗色): constant
#size (點的大小): constant
#alpha通透度

ggplot()+
  geom_point(
    data=data_split$"1",
    aes(
      x=x,y=y
    ),
    alpha=0.2,
    color="blue",
    size=10
    )+
  geom_point(
    data=data_split$"2",
    aes(
      x=x,y=y
    ),
    shape=21,
    fill="blue",
    color="black",
    size=10
  )

# Google sheets
googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 1"
) -> data1

#這邊做法會需要畫到三條線，但如果更改資料
ggplot(
  data=data1
)+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index1,
      color="red")
    )
  


###
# pivot wide data to long data
tidyr::pivot_longer(
  data=data1,
  cols=2:4, #(列的轉換)
  # column names to What
  names_to = "IndexName",
  values_to = "IndexValue"
) -> data1_long

ggplot(
  data=data1_long
)+
  geom_line(
    aes(
      x=Time,
      y=IndexValue,
      color=IndexName
    )
  )


tidyr::pivot_wider(
  data=data1_long,
  names_from = "IndexName",
  values_from= "IndexValue"
) ->dara1_wide





