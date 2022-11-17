data9hw1 <- read.csv("/Users/liurenhao/Documents/GitHub/111-1-econDV/111-1-econDV/week9/econDV2作業1/工作表 2-表格 1.csv")
# https://web02.mof.gov.tw/njswww/WebMain.aspx?sys=100&funid=defjsptgl

tidyr::pivot_longer(
  data = data9hw1,
  cols = 2:20, 
  names_to = "Product",values_to = "Export"
) |> mutate(year=as.numeric(year)
)  |> mutate(Export=as.numeric(Export))-> data9hw1_2


plot$ggplot <- ggplot(data = data9hw1_2 )
plot$geoms <- list(geom_tile(aes(x=year,y=Product,fill=Export),colour="gray"))
plot$themes <- list(theme(
  axis.ticks.y=element_blank()),scale_x_continuous(expand=c(0,0)),xlab(NULL),ylab(NULL))
plot$scale <- scale_fill_gradient2(
  limit=c(0,1),
  low = "white",
  high="#f00000"
  )
plt$explain = list(
  labs(
    title="台灣出口中國產品",
    subtitle="歷年比重變化",
    caption="資料來源：中華民國財政部",
    tag="figure1"
  ),xlab(NULL)
  )
plot$ggplot+plot$geoms+plot$themes+theme(legend.position = "none")+plot$scale+plt$explain
ggdash()
