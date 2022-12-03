library(readxl)
library(dplyr)
library(targets)
library(ggplot2)
library(econDV2)
if(!require(showtext)) install.packages("showtext")
showtext::showtext_auto()
data12 <- read_xlsx("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week12/活頁簿2.xlsx", sheet = "每年")
# https://stat.motc.gov.tw/mocdb/stmain.jsp?sys=100


  
data12 |> 
  mutate(高雄港 = as.numeric(高雄港)) |>
  mutate(基隆港 = as.numeric(基隆港)) |>
  mutate(臺中港 = as.numeric(臺中港)) |>
  mutate(臺北港 = as.numeric(臺北港)) |>
  mutate(蘇澳港 = as.numeric(蘇澳港)) |>
  mutate(安平港 = as.numeric(安平港)) |>
  mutate(桃園空港 = as.numeric(桃園空港)) |>
  mutate(總計 = as.numeric(總計)) -> data12_1

 
data12_1[is.na(data12_1)] <- 0

data12_1 |>
  mutate(其他 = (蘇澳港+安平港+臺中港+臺北港)/ 總計 ) |>
  mutate(高雄港 = 高雄港 / 總計 ) |> 
  mutate(基隆港 = 基隆港 / 總計 ) |>
  mutate(桃園空港 = 桃園空港 / 總計 ) ->
  data12_2

data12_2
data12_3 <- data12_2[,-2]
data12_3 <- data12_3[,-4:-7]


tidyr::pivot_longer(
  data = data12_3,
  cols = 2:5, 
  names_to = "港口",values_to = "貨運量佔比"
) -> data12_4


plot=list()
plot$ggplot <- ggplot(data = data12_4,aes(x = 年度, y = 貨運量佔比))
plot$geoms <- geom_area(aes(fill = 港口),stat = "identity")

data12_4$港口 |> unique()

plot$scale <-list(
  scale_y_continuous(position = "right",expand=c(0,0)),
  scale_fill_manual(
    limits = c("基隆港","高雄港","其他","桃園空港"),
    values = c("#ED90A4","#7EBA68","#6FB1E7", "#6a67654d")),
  scale_x_continuous(breaks = seq(2008,2021, by=2),
                     labels=c(2008, 2010, 2012, 2014, 2016, 2018,2020),
                     expand=c(0,0))
)
plot$others <- list()

plot$explain = list(
  labs(
    title="國際商港貨物裝卸量",
    subtitle="歷年比重變化",
    caption="資料來源：中華民國交通部"
  )
)
  
plot$ggplot+plot$geoms+plot$scale+plot$others+plot$explain

