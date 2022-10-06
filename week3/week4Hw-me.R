googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 4"
) -> data4
data4
library(ggplot2)
ggplot(data = data4,
       mapping=(aes(x="country",y="shareProfitable"))
       )

