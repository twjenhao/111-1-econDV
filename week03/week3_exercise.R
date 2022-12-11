googlesheets4::gs4_deauth()
googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 3"
) -> data3

library(ggplot2)
ggplot(data=data3,
mapping=aes(x=`Total Effect`, y=Characteristic))+
geom_point(
  shape=20,
  alpha=0.5,
  mapping=aes(
    color=Country,
    size=Population
  )
) +
geom_point(
  #shape=20,
  #size=1,
  mapping=aes(
    color=Country
  )
)


library(ggplot2)
ggplot(data=data3,
mapping=aes(x=`Total Effect`, y=Characteristic))+
geom_point(
  shape=21,
  alpha=0.5,
  mapping=aes(
    color=Country,
    fill=Country,
    size=Population
  )
) +
geom_point(
  #shape=20,
  #size=1,
  mapping=aes(
    color=Country
  )
) -> gg0
gg0
library(dplyr)
data3 |>
  group_by(Characteristic) |>
  summarise(
    maxMisery = max(`Total Effect`)
  ) |>
  ungroup() -> data3max

print(data3max)
gg0 +
geom_segment(
  data=data3max,
  mapping=aes(
    x=0, y=Characteristic,
    xend=maxMisery, yend=Characteristic
  ),
  alpha=0.7,
  color='black'
)

library(ggplot2)
library(dplyr)

data3max =
    data3 |>
    group_by(Characteristic) |>
    summarise(
      maxMisery=max(`Total Effect`)
    )
ggplot(data=data3,
mapping=aes(x=`Total Effect`, y=Characteristic))+
geom_segment(
  data =  data3max,
  mapping=aes(
    x=0, xend=maxMisery,
    y=Characteristic, yend=Characteristic
  )
)+
geom_point(
  shape=21,
  alpha=0.5,
  mapping=aes(
    color=Country,
    fill=Country,
    size=Population
  )
) +
geom_point(
  #shape=20,
  #size=1,
  mapping=aes(
    color=Country
  )
) -> gg0
gg0
gg0 +
geom_segment(
  data=data3max,
  mapping=aes(
    x=0, y=Characteristic,
    xend=maxMisery, yend=Characteristic
  ),
  alpha=0.7,
  color='black'
)
