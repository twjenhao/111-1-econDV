# download data ---------
googlesheets4::gs4_deauth()
googlesheets4::read_sheet(
  ss="https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit#gid=1655384974",
  sheet="data 4"
) -> data4
# Plot constructor -----------
Plot <- function(data) {
  library(ggplot2)
  plot = new.env()  # plot=list()
  plot$data=data
  plot$ggplot=NULL
  plot$geoms=NULL
  plot$make=function(){
    plot$ggplot+plot$geoms
  }
  plot$save=function(){
    saveRDS(plot, filename)
    message(paste("The plot is saved at ", filename))
  }
  return(plot)
}
# Initialize plot object -----------
plot=Plot(data4)
head(plot$data)
# define ggplot property
plot$ggplot=ggplot(data=plot$data, aes(x=country, y=shareProfitable))
# define geoms property
plot$geoms = list(
  geom_col(
    aes(fill=isOPEC, size=Volumn)
  )
)
# make the plot
plot$make() 
plot$make()
library(dplyr)
plot$data |>
  arrange(
    desc(Volumn)) |>
  mutate(
      halfVolumn = Volumn/2, # half of width
      accVolumn = lag(cumsum(Volumn)),
      accVolumn = dplyr::if_else(is.na(accVolumn),0, accVolumn), # set first acc to 0
      x = accVolumn + halfVolumn,
      yPos = shareProfitable/2,
      yNeg = -shareNonProfitable/2
    ) -> plot$data2

  head(plot$data2)
# set up geoms property -----------
plot$geoms = list(
  geom_tile(
    mapping = aes(
      x=x,y=yPos,
      width=Volumn,
      height=shareProfitable,
      fill=isOPEC),
    linetype='solid',
    color="white"),
  geom_tile(
    mapping = aes(
      x=x,y=yNeg,
      width=Volumn,
      height=shareNonProfitable,
      fill=isOPEC),
    linetype='solid',
    color="white",
    alpha=0.5),
  geom_text(
    mapping = aes(
      x=x, y=shareProfitable, label=country
    )
  )
)
plot$ggplot <- ggplot(data=plot$data2)
plot$make()
# complete code ------
plot=Plot(data4)
plot$data2 = {
  plot$data |>
  arrange(
    desc(Volumn)) |>
  mutate(
      halfVolumn = Volumn/2,
      accVolumn = lag(cumsum(Volumn)),
      accVolumn = dplyr::if_else(is.na(accVolumn),0, accVolumn),
      x = accVolumn + halfVolumn,
      yPos = shareProfitable/2,
      yNeg = -shareNonProfitable/2
    )
}
plot$ggplot = ggplot(data=plot$data2())
plot$geoms = list(
  geom_tile(
    mapping = aes(
      x=x,y=yPos,width=Volumn,height=shareProfitable,fill=isOPEC),
      linetype='solid',
      color="white"),
  geom_tile(
    mapping = aes(
      x=x,y=yNeg,width=Volumn,height=shareNonProfitable,fill=isOPEC),
      linetype='solid',
      color="white",
      alpha=0.5),
  geom_text(
    mapping = aes(
      x=x, y=shareProfitable, label=country
    )
  )
)
plot$make()
# ggpattern ------------
install.packages("ggpattern")
library(ggpattern)
plot$geoms[[2]] <-
  ggpattern::geom_tile_pattern(
      mapping = aes(
        x=x,y=yNeg,width=Volumn,height=shareNonProfitable,fill=isOPEC),
      linetype='solid',
      color="white",
      alpha=0.5,
      pattern="stripe"
    )
plot$make()
