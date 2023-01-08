
googlesheets4::gs4_deauth()
googlesheets4::read_sheet(ss="https://docs.google.com/spreadsheets/d/1715KOcf8LkNp3j0LeWTkbA-kq3q30pyooBElJ30caqo/edit#gid=1318868749",
                          sheet = "sheet4")->passengers


options(scipen = 999)

ggplot(data=passengers,
       mapping = aes(x=reorder(station,passenger),y=passenger,
                     fill=type,colour=type))+
  scale_x_discrete(limits = rev)+
  geom_col(position = position_dodge(0.9),
           color="black",
           width = 0.8)+
  labs(title="國旅熱點臺南的高鐵旅客數 位居中後段?",
       subtitle = "以2022年1至11月進出站旅客數為例",
       caption = "資料來源:台灣高鐵https://corp.thsrc.com.tw/corp/9571df11-8524-4935-8a46-0d5a72e6bc7c",
       x="站名",
       y="旅客人數")+
  theme(plot.title = element_text(size = 20),
        plot.subtitle = element_text(size = 18),
        axis.title.y = element_text(size = 16),
        axis.title.x = element_text(size = 16),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.text = element_text(size = 20),
        legend.title = element_blank(),
        plot.caption = element_text(size = 10)
  )+
  scale_y_continuous(expand=c(0,0))
ggdash()  

