googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1lkts4hLkrAFAobONFXiEjgDnuUmXKci6YF--vg1pC1s/edit?usp=sharing",
  sheet="data 4"
) -> data4
data4

gg41 <- ggplot(data=data4,
       )+
  geom_col(
    color="White",
    width=1,
    mapping = aes(x=country,y=shareProfitable,
                  fill=isOPEC,
                  )
    )+
  geom_col(
    alpha=0.3,
    linetype="f1",
    color="Gray",
    width=1,
    mapping = aes(x=country,y=-shareNonProfitable,
                  fill=isOPEC,
                  )
    )+
  geom_text(
    nudge_y = 0.03,
    aes(x=country,y=shareProfitable,label=country)
  )
gg41







gg41Width <- ggplot(
  data=data4,mapping=
    aes(x=country,width=3*Volumn/sum(Volumn))
)+
  geom_col(
    color="White",
    mapping = aes(y=shareProfitable,
                  fill=isOPEC,
    )
  )+
  geom_col(
    alpha=0.3,
    linetype="f1",
    color="Gray",
    mapping = aes(y=-shareNonProfitable,
                  fill=isOPEC,
    )
  )+
  geom_text(
    nudge_y = 0.03,
    aes(x=country,y=shareProfitable,label=country)
  )

gg41Width


gg41Width+
  geom_segment(
  data=data4,
  mapping=aes(
    x=0, y=0,
    xend=7.5, yend=0
  ),
  alpha=0.7,
  color='black'
)


