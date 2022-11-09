data0=data.frame(
  x=c(1, 2, 3, 4),
  y=c(2, 3, 6, 7),
 alpha_stroke=c("A","B","A","B")
)
split(data0,data0$alpha_stroke) -> 
  data_split
data_split
# data cleaning /manipulation
ggplot()+
  geom_point( # 透明組
    data=data_split$A,
    aes(
      x=x,y=y
    ),
    alpha=0.1,
    color="blue",
    size=3
  )+
  geom_point(
    data=data_split$B,
    aes(
      x=x, y=y
    ),
    shape=21,
    size=3,
    fill="blue", # 填色
    color="black" # stroke顏色
  )
  
  
# Google sheets
googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 1"
) -> data1

#
ggplot(
  data=data1
)+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index1
    ),
    color="black"
  )+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index2
    ),
    color="red"
  )+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index3
    ),
    color="green"
  )

###
# pivot wide data to long data
tidyr::pivot_longer(
  data=data1,
  cols=2:4,
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
  values_from = "IndexValue"
) -> data1_wide
