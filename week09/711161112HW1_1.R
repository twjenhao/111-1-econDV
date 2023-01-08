library(readxl)
library(dplyr)
library(targets)
library(ggplot2)
library(econDV2)
library(readxl)
showtext::showtext_auto()



####讀取資料####
url <- "https://github.com/twjenhao/111-1-econDV/blob/main/week09/econDV2%E4%BD%9C%E6%A5%AD1/%E4%B8%AD%E5%9C%8B%E5%87%BA%E5%8F%A3%E8%B3%87%E6%96%99%E5%8E%9F%E5%A7%8B%E6%AA%94.csv?raw=true&quot";
destfile9 <- "中國出口資料原始檔.csv"
curl::curl_download(url, destfile9)
data9 <- read.csv(destfile9)



####資料整理####
data9_1 <- data9 %>% select(-Country)
colnames(data9_1) <- c('year','活動物；動物產品','植物產品','動植物油脂','調製食品；飲料及菸酒','礦產品','化學品','塑膠、橡膠及其製品','毛皮及其製品','木及木製品','紙漿；紙及其製品；印刷品','紡織品',
                     '鞋、帽及其他飾品','非金屬礦物製品','珠寶及貴金屬製品','基本金屬及其製品','機械及電機設備','運輸工具','光學及精密儀器；鐘錶；樂器','其他')
data9_1 <- data9_1 %>% mutate(加總 =`活動物；動物產品`+植物產品+動植物油脂+`調製食品；飲料及菸酒`+礦產品+化學品+`塑膠、橡膠及其製品`+毛皮及其製品+木及木製品+`紙漿；紙及其製品；印刷品`+紡織品+`鞋、帽及其他飾品`+非金屬礦物製品+珠寶及貴金屬製品+基本金屬及其製品+機械及電機設備+運輸工具+`光學及精密儀器；鐘錶；樂器`+其他)
data9_2 <- data9_1 %>%mutate("活動物；動物產品" = `活動物；動物產品`/加總)
data9_2 <- data9_2 %>%mutate("植物產品" = `植物產品`/加總)
data9_2 <- data9_2 %>%mutate("動植物油脂" = `動植物油脂`/加總)
data9_2 <- data9_2 %>%mutate("動植物油脂" = `動植物油脂`/加總)
data9_2 <- data9_2 %>%mutate("調製食品；飲料及菸酒" = `調製食品；飲料及菸酒`/加總)
data9_2 <- data9_2 %>%mutate("礦產品" = `礦產品`/加總)
data9_2 <- data9_2 %>%mutate("化學品" = `化學品`/加總)
data9_2 <- data9_2 %>%mutate("塑膠、橡膠及其製品" = `塑膠、橡膠及其製品`/加總)
data9_2 <- data9_2 %>%mutate("毛皮及其製品" = `毛皮及其製品`/加總)
data9_2 <- data9_2 %>%mutate("木及木製品" = `木及木製品`/加總)
data9_2 <- data9_2 %>%mutate("紙漿；紙及其製品；印刷品" = `紙漿；紙及其製品；印刷品`/加總)
data9_2 <- data9_2 %>%mutate("紡織品" = `紡織品`/加總)
data9_2 <- data9_2 %>%mutate("鞋、帽及其他飾品" = `鞋、帽及其他飾品`/加總)
data9_2 <- data9_2 %>%mutate("非金屬礦物製品" = `非金屬礦物製品`/加總)
data9_2 <- data9_2 %>%mutate("珠寶及貴金屬製品" = `珠寶及貴金屬製品`/加總)
data9_2 <- data9_2 %>%mutate("基本金屬及其製品" = `基本金屬及其製品`/加總)
data9_2 <- data9_2 %>%mutate("機械及電機設備" = `機械及電機設備`/加總)
data9_2 <- data9_2 %>%mutate("運輸工具" = `運輸工具`/加總)
data9_2 <- data9_2 %>%mutate("光學及精密儀器；鐘錶；樂器" = `光學及精密儀器；鐘錶；樂器`/加總)
data9_2 <- data9_2 %>%mutate("其他" = `其他`/加總)
data9_2 <- data9_2 %>% mutate(加總 =`活動物；動物產品`+植物產品+動植物油脂+`調製食品；飲料及菸酒`+礦產品+化學品+`塑膠、橡膠及其製品`+毛皮及其製品+木及木製品+`紙漿；紙及其製品；印刷品`+紡織品+`鞋、帽及其他飾品`+非金屬礦物製品+珠寶及貴金屬製品+基本金屬及其製品+機械及電機設備+運輸工具+`光學及精密儀器；鐘錶；樂器`+其他)
data9_2 <- data9_2 %>%mutate("其他出口品" = (`活動物；動物產品`+`植物產品`+`動植物油脂`+`調製食品；飲料及菸酒`+礦產品+毛皮及其製品+木及木製品+`紙漿；紙及其製品；印刷品`+`鞋、帽及其他飾品`+非金屬礦物製品+珠寶及貴金屬製品+運輸工具+其他)/加總)
data9_3 <- data9_2 %>% select(-`活動物；動物產品`,-植物產品,-`動植物油脂`,-`調製食品；飲料及菸酒`,-礦產品,-毛皮及其製品,-木及木製品,-`紙漿；紙及其製品；印刷品`,-`鞋、帽及其他飾品`,-非金屬礦物製品,-珠寶及貴金屬製品,-運輸工具,-其他,-加總)
data9_3 <- select(data9_3,'year','機械及電機設備','光學及精密儀器；鐘錶；樂器','化學品','塑膠、橡膠及其製品','紡織品','基本金屬及其製品',"其他出口品")
tidyr::pivot_longer(
  data = data9_3,
  cols = 2:8, 
  names_to = "Product",values_to = "Export") |> 
  mutate(year=as.numeric(year)) |> 
  mutate(Export=as.numeric(Export))-> data9_4



####繪圖####
plot=list()
plot$ggplot <- ggplot(data = data9_4 )
plot$geoms <- list(
  geom_tile(aes(x=year,y=Product,fill=Export),
            colour="gray"))

plot$themes <- list(
  theme(axis.ticks.y=element_blank()),
  scale_x_continuous(expand=c(0,0)),
  xlab(NULL),
  ylab(NULL)
  )
plot$scale <- list(
  scale_fill_gradient2(
  limit=c(0,1),
  low = "white",
  high="#f00000"),
  scale_y_discrete(limits=c("其他出口品",'基本金屬及其製品','紡織品','塑膠、橡膠及其製品','化學品','光學及精密儀器；鐘錶；樂器','機械及電機設備')
                   ))
plot$explain = list(
  labs(
    title="台灣出口中國產品佔比",
    subtitle="歷年比重變化",
    caption="資料來源：中華民國財政部"
  ),xlab(NULL)
  )

plot$ggplot+plot$geoms+plot$themes+plot$scale+plot$explain ->g1
g1
ggdash()

