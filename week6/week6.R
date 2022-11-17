install.packages("showtext")
install.packages("sysfonts")
install.packages("showtextdb")
install.packages("esquisse")

showtext::showtext_auto()


newCompanies = readr::read_csv("https://data.gcis.nat.gov.tw/od/file?oid=8B227133-FFAB-4218-963C-21846226B750")
newCompanies
library(dplyr)
newCompaniestest = newCompanies |> 
  dplyr::mutate(
    "無限公司資本額比重" = 無限公司資本額/總計資本額,
    "兩合公司資本額比重" = 兩合公司資本額/總計資本額,
    "股份有限公司資本額比重" = 股份有限公司資本額/總計資本額,
    "有限公司資本額比重" = 有限公司資本額/總計資本額
  )
select(newCompaniestest,-(2:17))->newCompaniestest2
newCompaniestest2 = 
  dplyr::slice(newCompaniestest1,-(1:2))
names(newCompaniestest2)


newCompaniestest2

library(ggplot2)
plt = new.env()
plt$ggplot = ggplot(data=newCompaniestest2)
plt$geoms = list(
  geom_col(
    mapping=aes(
      x=`縣 市 別`,
      y=股份有限公司資本額比重
    )
  )
)

plt$theme = theme(
  axis.text.x = element_text(
    angle=45,
    hjust = 1 
  )
)

plt$ggplot + plt$geoms
plt$ggplot + plt$geoms + plt$theme

#-----------------------------------------------------------------
library(esquisse)

#老師補充
plt$theme = list(
  theme(
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    panel.grid.major.y = element_line(color="#c4d1d7")
  )
)








