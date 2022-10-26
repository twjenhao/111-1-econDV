# Source your local files
c(
  "~/Documents/GitHub/111-1-econDV/temp/marriageSupport.R",
  "~/Documents/GitHub/111-1-econDV/temp/makeup.R") |> purrr::walk(source)
#------------------------------------------
  
# Every line is executed inside your local machine
library(tidyverse)#綜合的套件有包含dplyr
marriage = readr::read_csv("marriage.csv")
marriage |> 
  getMarriageTauYuan() |> 
  correctClass() |>
  prepareProportionFemaleLateMarriage() -> marriageTaoYuanLate

#-----------------------------------------

ggplot(data=marriageTaoYuanLate)+
  geom_col(
    mapping=aes(
      x=site_id2,
      y=prop_marry_pair_late
    ),
    fill="dodgerblue3" #老師喜歡的顏色道奇藍
    #可以從這邊找顏色657種顏色
    #https://www.datanovia.com/en/blog/awesome-list-of-657-r-color-names/
  ) + coord_flip()

#----------------------------------------
googledrive::drive_deauth()
googledrive::drive_download("https://drive.google.com/file/d/1Cd4paAOsEs8Rec-4o8VNh6MfsXMLo-qs/view?usp=sharing", 
                            overwrite =T)
eachTypeCompanyCapital_long = readRDS(
  "eachTypeCompanyCapital_long.Rds"
)
ggplot(data=eachTypeCompanyCapital_long)+
  geom_col(
    mapping=aes(
      x=`縣 市 別`,
      y=CompanyTypeCapital, # 佔比的來源
      fill=CompanyType
    ),
    position="fill" # 
  )


  
  
  
  
  
  
  
  
  
  




