googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 3"
) -> data3
data3

split(data3,data3$Country) -> data3_split


ggplot()+
  geom_point(data=data3_split$a,
    aes(
      x=Total""Effect,
      y=Characteristic),
    color="Pink",
    size=10,
    shape=20,
    alpha=0.5
    )+
  geom_point(data=data3_split$b,
      aes(
      x=data3_split$b[[4]],
      y=Characteristic),
    color="Black",
    size=10,
    shape=20,
    alpha=0.5
  )+
  geom_point(data=data3_split$c,
      aes(
      x=data3_split$c[[4]],
      y=Characteristic),
    color="Blue",
    size=10,
    shape=20,
    alpha=0.5
  )+
  geom_point(data=data3_split$d,
      aes(
      x=data3_split$d[[4]],
      y=Characteristic),
    color="Yellow",
    size=10,
    shape=20,
    alpha=0.5
  )+
  geom_point(data=data3_split$a,
             aes(
               x=data3_split$a[[4]],
               y=Characteristic),
             color="Pink",
             size=1,
             shape=20,
             alpha=1
  )+
  geom_point(data=data3_split$b,
             aes(
               x=data3_split$b[[4]],
               y=Characteristic),
             color="Black",
             size=1,
             shape=20,
             alpha=1
  )+
  geom_point(data=data3_split$c,
             aes(
               x=data3_split$c[[4]],
               y=Characteristic),
             color="Blue",
             size=1,
             shape=20,
             alpha=1
  )+
  geom_point(data=data3_split$d,
             aes(
               x=data3_split$d[[4]],
               y=Characteristic),
             color="Yellow",
             size=1,
             shape=20,
             alpha=1
  )



data3_split$"b"
data3_split$"a"


#color (線框顏色): constant
#stroke (線框粗細): constant
#fill (內部塗色): constant
#size (點的大小): constant
#alpha通透度
