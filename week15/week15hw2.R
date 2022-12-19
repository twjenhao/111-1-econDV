data153 <- read_xlsx("/Users/liurenhao/Documents/TaipeiuniversityNote/EconmicVisual/111-1-econDV/week15/消費佔GDP比重.xlsx",sheet="sheet2")
# OECD.Stat: https://stats.oecd.org/index.aspx

data153_1 <- t(data153)


class(data153_1)
as.data.frame(data153_1)->data153_2
class(data153_2)
colnames(data153_2)[1:4] <- list("Germany","USA","Japan","Taiwan")
data153_3 <- data153_2[-1:-14,]
data153_3 <- data153_3[,c(-1,-3)]
data153_4 <- data.frame(year=c(1984:2021))
class(data153_4)
cbind(data153_4,data153_3) ->data153_5
rownames(data153_5)[1:38] <- c(1:38)

tidyr::pivot_longer(
  data = data153_5,
  cols = 2:3, 
  names_to = "Country",values_to = "消費占GDP成長率"
) -> data153_6

data153_6 |> 
  mutate( 消費占GDP成長率 = as.numeric(消費占GDP成長率)) ->data153_7

plot153=list()
plot153$ggplot <- ggplot(data = data153_7,aes(x = year, y = 消費占GDP成長率))
plot153$geoms <- list(geom_line(aes(colour = Country),
),
geom_point(size=0.5,aes(colour = Country))
)

plot153$scale <-list(
  scale_x_continuous(
    expand=c(0,0),
    breaks = c(1984,seq(1989,2015,by=5),2021)),
  scale_y_continuous(expand=c(0,0),
                     position="right",
                     breaks = c(0,seq(-0.2,0.9,by=0.04))), #seq(0.4,0.7,by=0.1)
  scale_colour_discrete(breaks=(c("USA","Taiwan")))
)

plot153$explain = list(
  labs(
    title="消費是否會受到景氣波動的影響",
    subtitle="台灣人與美國人之間消費習慣的差異",
    caption="Source: OECD, 中華民國主計處"
  )
)

plot153$others <- list(
  xlab(NULL),ylab(NULL),
  theme(legend.position="left",
        plot.title = element_text(hjust=0),
        plot.subtitle = element_text(hjust=0)
  )
)

plot153$ggplot+plot153$geoms+plot153$others+plot153$explain+plot153$scale

