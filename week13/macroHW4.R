library(readxl)
library(tidyr)
library(dplyr)
library(targets)
library(ggplot2)
library(econDV2)
library(showtext)
if(!require(showtext)) install.packages("showtext")
# 描述，if(!require(showtext))，if:如果，！:沒有，showtext套件的話，
# require()會回傳true or false
# install.packages("showtext")就安裝 showtex
showtext_auto()
# 如果有"library(showtext)"的話就不用這樣寫"showtext::showtext_auto()"
macro13 <- read_xlsx("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week13/消費佔GDP比重.xlsx")
# OECD.Stat: https://stats.oecd.org/index.aspx

macro13_1 <- t(macro13)


class(macro13_1)
as.data.frame(macro13_1)->macro13_2
class(macro13_2)
macro13_2
colnames(macro13_2)[1:4] <- list("Germany","USA","Japan","Taiwan")
macro13_3 <- macro13_2[-1:-15,]
macro13_3
macro13_3 <- macro13_3[,c(-1,-3)]
macro13_3 
macro13_4 <- data.frame(year=c(1984:2021))
macro13_4
class(macro13_4)
cbind(macro13_4,macro13_3) ->macro13_5
rownames(macro13_5)[1:38] <- c(1:38)
macro13_5
# 如果沒有library(dplyr)，才需要這樣打dplyr::
pivot_longer(
  data = macro13_5,
  cols = 2:3, 
  names_to = "Country",values_to = "消費占GDP比重"
) -> macro13_6

macro13_6 |> 
  mutate( 消費占GDP比重 = as.numeric(消費占GDP比重)) ->macro13_7
macro13_7


plot13M=list()
plot13M$ggplot <- ggplot(data = macro13_7,aes(x = year, y = 消費占GDP比重))
plot13M$geoms <- list(
  geom_line(aes(colour = Country)),
  geom_point(size=0.5,aes(colour = Country))
  )
plot13M$scale <-list(
  scale_x_continuous(
    expand=c(0,0),
    breaks = c(1984,seq(1994,2015,by=10),2021)),
  scale_y_continuous(expand=c(0,0),
                     position="right",
                     breaks = c(0.45,0.68)),#seq(0.4,0.7,by=0.1)
  scale_colour_discrete(breaks=c("USA","Taiwan"))
)


plot13M$explain = list(
  labs(
    title="Households and NPISHs final consumption expenditure \n (% of GDP)",
    caption="Source: OECD, 中華民國主計處",
    
  )
)

plot13M$others <- list(
  
  xlab(NULL),ylab(NULL),
  annotate("rect", 
           xmin = 2019, xmax = 2021, 
           ymin = 0.4, ymax = 0.7,
           alpha = 0.2,colour = "transparent"),
  theme(legend.position="left",
        plot.title = element_text(hjust=1)
        )
  # theme(panel.grid.major.x = element_line(colour='grey',linetype="solid"))
)

plot13M$ggplot+plot13M$geoms+plot13M$others+plot13M$explain+plot13M$scale
ggdash()


# ----------------------------------------------------------



data132 <- read_xlsx("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week13/消費佔GDP比重.xlsx",sheet="sheet2")
# OECD.Stat: https://stats.oecd.org/index.aspx

data132_1 <- t(data132)


class(data132_1)
as.data.frame(data132_1)->data132_2
class(data132_2)
colnames(data132_2)[1:4] <- list("Germany","USA","Japan","Taiwan")
data132_2
data132_3 <- data132_2[-1:-14,]
data132_3
data132_3 <- data132_3[,c(-1,-3)]
data132_3
data132_4 <- data.frame(year=c(1984:2021))
class(data132_4)
cbind(data132_4,data132_3) ->data132_5
data132_5
rownames(data132_5)[1:38] <- c(1:38)

tidyr::pivot_longer(
  data = data132_5,
  cols = 2:3, 
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
    breaks = c(1984,seq(1994,2015,by=10),2021)),
  scale_y_continuous(expand=c(0,0),
                     position="right",
                     breaks = c(0,seq(-0.2,0.9,by=0.04))), #seq(0.4,0.7,by=0.1)
  scale_colour_discrete(breaks=(c("USA","Taiwan")))
)

plot132$explain = list(
  labs(
    title="Growth rate ",
    subtitle="Households and NPISHs final consumption expenditure",
    caption="Source: OECD, 中華民國主計處"
  )
)

plot132$others <- list(
  xlab(NULL),ylab(NULL),
  theme(legend.position="left",
        plot.title = element_text(hjust=-0.1),
        plot.subtitle = element_text(hjust=0.5)
  )
)

plot132$ggplot+plot132$geoms+plot132$others+plot132$explain+plot132$scale

