library(readxl)
library(tidyr)
library(dplyr)
library(targets)
library(ggplot2)
library(econDV2)
if(!require(showtext)) install.packages("showtext")
# 描述，if(!require(showtext))，if:如果，！:沒有，showtext套件的話，
# require()會回傳true or false
# install.packages("showtext")就安裝 showtext
showtext::showtext_auto()
library(readxl)
url <- "https://github.com/twjenhao/111-1-econDV/blob/main/week13/%E6%B6%88%E8%B2%BB%E4%BD%94GDP%E6%AF%94%E9%87%8D.xlsx?raw=true"
destfile <- "data13.xlsx"
curl::curl_download(url, destfile)
#如果上面沒有library就需要打curl::
data13 <- read_excel(destfile)
# OECD.Stat: https://stats.oecd.org/index.aspx

data13_1 <- t(data13)


class(data13_1)
as.data.frame(data13_1)->data13_2
class(data13_2)
colnames(data13_2)[1:4] <- list("Germany","USA","Japan","Taiwan")
data13_3 <- data13_2[-1,]
data13_4 <- data.frame(year=c(1970:2021))
class(data13_4)
cbind(data13_4,data13_3) ->data13_5
rownames(data13_5)[1:52] <- c(1:52)

tidyr::pivot_longer(
  data = data13_5,
  cols = 2:5, 
  names_to = "Country",values_to = "消費占GDP比重"
) -> data13_6

data13_6 |> 
  mutate( 消費占GDP比重 = as.numeric(消費占GDP比重)) ->data13_7
data13_7


plot13=list()
plot13$ggplot <- ggplot(data = data13_7,
                        aes(x = year, y = 消費占GDP比重))
plot13$geoms <- list(geom_line(aes(colour = Country),
                               ),
                     geom_point(size=0.5,aes(colour = Country))
)

plot13$scale <-list(
  scale_x_continuous(
    expand=c(0,0),
    breaks = c(1970,seq(1980,2000,by=10),2009,2021),
    position = "bottom"),
  scale_y_continuous(expand=c(0,0),
                     position="right",
                     breaks = c(0.45,0.49,0.54,0.68)) #seq(0.4,0.7,by=0.1)
  )

plot13$explain = list(
  labs(
    title="家計單位消費佔所得比重",
    subtitle="賺越多花越多？",
    caption="Source: OECD, 中華民國主計處",
    
  )
)

plot13$others <- list(
  xlab(NULL),ylab(NULL),
  annotate("rect", 
           xmin = 2009, xmax = 2021, 
           ymin = 0.4, ymax = 0.7,
           alpha = .1,colour = "transparent"),
  theme(legend.position="left",
        plot.title = element_text(hjust=0)
        
        )
  # theme(panel.grid.major.y = element_line(colour='grey',linetype="solid"))
)

plot13$ggplot+plot13$geoms+plot13$others+plot13$explain+plot13$scale
ggdash()



# ----------------------------------------------------------
library(curl)
library(readxl)
url <- "https://github.com/twjenhao/111-1-econDV/blob/main/week13/%E6%B6%88%E8%B2%BB%E4%BD%94GDP%E6%AF%94%E9%87%8D.xlsx?raw=true"
destfile <- "data13.xlsx"
curl::curl_download(url, destfile) 
#如果上面沒有library就需要打curl::
curl_download(url, destfile)
data132 <- read_excel(destfile)
# OECD.Stat: https://stats.oecd.org/index.aspx


data132_1 <- t(data132)


class(data132_1)
as.data.frame(data132_1)->data132_2
class(data132_2)
colnames(data132_2)[1:4] <- list("Germany","USA","Japan","Taiwan")
data132_3 <- data132_2[-1,]
data132_4 <- data.frame(year=c(1970:2021))
class(data132_4)
cbind(data132_4,data132_3) -> data132_5
rownames(data132_5)[1:51] <- c(1:51)

tidyr::pivot_longer(
  data = data132_5,
  cols = 2:5, 
  names_to = "Country",values_to = "消費占GDP成長率"
) -> data132_6

data132_6 |> 
  mutate( 消費占GDP成長率 = as.numeric(消費占GDP成長率)) ->data132_7
data132_7


plot132=list()
plot132$ggplot <- ggplot(data = data132_7,aes(x = year, y = 消費占GDP成長率))
plot132$geoms <- list(geom_line(aes(colour = Country),
),
geom_point(size=0.5,aes(colour = Country))
)

plot132$scale <-list(
  scale_x_continuous(
    expand=c(0,0),
    breaks = c(1970,seq(1970,2000,by=10),2013,2021)),
  scale_y_continuous(expand=c(0,0),
                     position="right",
                     breaks = c(0,seq(-0.1,0.9,by=0.04))) #seq(0.4,0.7,by=0.1)
)

plot132$explain = list(
  labs(
    title="Growth rate ",
    subtitle="of Household consumption expenditure (% of GDP)",
    caption="Source: OECD, 中華民國主計處"
  )
)

plot132$others <- list(
  xlab(NULL),ylab(NULL),
  theme(legend.position="left",
        plot.title = element_text(hjust=-0.1),
        plot.subtitle = element_text(hjust=1)
        )
)

plot132$ggplot+plot132$geoms+plot132$others+plot132$explain+plot132$scale
  
  

