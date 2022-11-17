# Source your local files
c(
  "~/Documents/GitHub/111-1-econDV/temp/marriageSupport.R",
  "~/Documents/GitHub/111-1-econDV/temp/makeup.R") |> purrr::walk(source)
#------------------------------------------

#Colors with name
#https://www.datanovia.com/en/blog/awesome-list-of-657-r-color-names/

#------------------------------------------
# Every line is executed inside your local machine
library(tidyverse)#綜合的套件有包含dplyr
marriage = readr::read_csv("marriage.csv")
marriage |> 
  getMarriageTauYuan() |> 
  correctClass() |>
  prepareProportionFemaleLateMarriage() -> marriageTaoYuanLate

ggplot(data=marriageTaoYuanLate)+
  geom_col(
    mapping=aes(
      x=site_id2,
      y=prop_marry_pair_late
    ),
    fill="dodgerblue3"
  ) + coord_flip()

#-----------------------------------------
#Another example
#-----------------------------------------

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

#-----------------------------------------

#Makeup
#Both graphs use geom_col.

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
    position="fill" 
  )

#----------------------------------------
#Makeup
#Both graphs use geom_col.
#----------------------------------------

makeup = Makeup()
makeup$geom_col() -> geom_col2
ggplot(data=eachTypeCompanyCapital_long)+
  geom_col2$geom(
    mapping=aes(
      x=`縣 市 別`,
      y=CompanyTypeCapital, # 佔比的來源
      fill=CompanyType
    ),
    position="fill" # 
  ) + geom_col2$scale_y_continuous()
  
  
  
  
  
  
  
  
  




