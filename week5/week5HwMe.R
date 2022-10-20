googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 5"
) -> data5
library(ggplot2)

ggplot(data=data5,aes(x=gdppp, y=avgLifeSatisfaction))+
  geom_point()+
  geom_spoke(
    aes(angle=`high-low satisfaction disparity`),
    radius=1
  )+
  geom_spoke(
    mapping=aes(
                angle=`high-low satisfaction disparity`),
    radius=-1
    )+
  geom_text(
    nudge_y = 0.1,
    nudge_x = 400,
    aes(label=country)
  )
  
  
  
  
  
 

  
