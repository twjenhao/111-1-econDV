library(ggplot2)
library(ggpol)
library(curl)
library(readxl)
showtext::showtext_auto()


url <- "https://github.com/twjenhao/111-1-econDV/blob/main/week15/111%E5%B9%B4%E7%9B%B4%E8%BD%84%E5%B8%82%E8%AD%B0%E5%93%A1%E9%81%B8%E8%88%89.xlsx?raw=true"
# 在url最後要加這一段“?raw=true”執行下面程式才可以下載到檔案
destfile15 <- "111年直轄市議員選舉.xlsx"
curl_download(url, destfile15)
data15 <- read_xlsx(destfile15)
party=factor(data15$推薦政黨,levels = c("民主進步黨","中國國民黨","無黨籍及未經政黨推薦","台灣民眾黨","臺灣人民共產黨",
                                    "社會民主黨","小民參政歐巴桑聯盟","中國國家社會主義勞工黨","台灣動物保護黨","台灣基進",
                                    "金色力量黨","共和黨","時代力量","新黨","綠黨"))
party
data15$推薦政黨
ggplot(data15) + 
  geom_parliament(aes(seats = seats, fill = party), color = "black") +
  scale_fill_manual(values = data15$Group, labels = data15$推薦政黨) +
  coord_fixed() + 
  theme_void()+
  theme()





bt <- data.frame(
  parties = factor(c("CDU", "CSU", "AfD", "FDP", "SPD", 
                     "Linke", "Gruene", "Fraktionslos"),
                   levels = c("CDU", "CSU", "AfD", "FDP", "SPD", 
                              "Linke", "Gruene", "Fraktionslos")),
  seats   = c(200, 46, 92, 80, 153, 69, 67, 2),
  colors  = c("black", "blue", "lightblue", "yellow", 
                     "red","purple", "green", "grey"),
                     stringsAsFactors = FALSE)
ggplot(bt) + 
  geom_parliament(aes(seats = seats, fill = parties), color = "black") + 
  # scale_fill_manual(values = bt$colors, labels = bt$parties) +
  coord_fixed() + 
  theme_void()

