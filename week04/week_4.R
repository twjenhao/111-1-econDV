
date = lubridate::ymd(c("2020-02-01", "2020-04-01",
  "2020-06-01", "2020-09-01"))
data = list()
data$Britain <- 
  data.frame(
    date = date,
    y = c(0, 50, 80, 100)
  )
data$Spain <-
  data.frame(
    date = date,
    y = c(0, 32, 53, 103)
  )
data$Italy <-
  data.frame(
    date = date,
    y = c(0, 50, 60, 99)
  )

plot = Plot(data=data)
data$Britain$country="Britain"
data$Italy$country="Italy"
data$Spain$country="Spain"
dataAll = dplyr::bind_rows(
  data$Britain, data$Italy, data$Spain
)

plot$dataAll = dataAll
library(ggplot2)
plot$ggplot = ggplot(aes(
  x
))
plot$geoms = list(
  geom_line(
    data=plot$dataAll,
    aes(color)
  )
)
library(ggplot2)
plot$ggplot = ggplot(mapping=aes(
  x=date
))
plot$geoms = list(
  geom_line(
    data=plot$dataAll,
    aes(color=country)
  )
)
library(ggplot2)
plot$ggplot = ggplot(data=plot$dataAll,mapping=aes(
  x=date, y=y
))
plot$geoms = list(
  geom_line(
    mapping=aes(color=country)
  )
)
plot$ggplot+plot$geoms
# plot$geoms |> append(list(geom_text())) -> plot$geoms

# or
plot$geoms2 = list(
  plot$geoms[[1]],
  geom_text(
    data= data.frame(
      x=lubridate::ymd(c("2020-04-01")),
      y=c(25),
      label=c("Spain")
    ),
    mapping=aes(
      x =x, y=y, label=label
    )
  ),
  geom_hline(
    aes(yintercept=0)
  )
)
plot$ggplot+plot$geoms2
