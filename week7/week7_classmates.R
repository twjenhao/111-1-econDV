plot <- Plot(data1)
plot$ggplot <- ggplot(data=plot$data)
plot$theme= list(
  theme(
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    panel.grid.major.y = element_line(color="#c4d1d7")
  ))
plot$geom=list(
  geom_bin_2d(
    mapping=aes(
      x=year,
      y=country,
      fill=lifeExpectancy
    ),
    binwidth = 0.5
  )
)

plot$ggplot+plot$theme+plot$geom+coord_flip()
