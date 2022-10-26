if(!require(showtext)) install.packages("showtext")
showtext::showtext_auto()
library(ggplot2)
# set our graph theme to use the google font and a classic white back ground
theme_set(
  theme(
    text=element_text(family = "Noto Sans TC")
  )+
    theme_classic()
)
googledrive::drive_deauth()
googledrive::drive_download(
  file=googledrive::as_id("https://drive.google.com/file/d/1K8IWyy7G9LAKewjVXMGD8kUbbvjGoRT7/view?usp=sharing"),
  overwrite = T
)
library(readr)
marriage <- read_csv("marriage.csv")
head(marriage)

library(dplyr)
marriageTaoYuan = {
  marriage |>
    dplyr::filter(
      # 只看桃園市
      stringr::str_detect(site_id,"桃園市") #必須為vector right function
    ) -> marriageTaoYuan
  marriageTaoYuan |>
    # 創造行政區欄位
    mutate(
      site_id2 = stringr::str_sub(site_id,4,6)
    ) 
  
}


# 結婚年齡
# X：以妻年齡來看
# Y：對數
library(ggplot2)
plt = new.env()
plt$ggplot = ggplot(data=marriageTaoYuan)
plt$geoms = list(
  geom_col(
    mapping=aes(
      x=female_age_or_spouse1,
      y=marry_pair
    ),
    position="stack" # sum across sites within same age group.
  )
)
plt$ggplot + plt$geoms 
#plt$ggplot + plt$geoms +coord_flip() #新增coord_flip()使圖形轉向









#theme

#資料幾何以外的調整
plt$ggplot() + 
  plt$geoms() + 
  theme(
    axis.text.x = element_text(
      angle=45,
      hjust = 1 # define text position base point using its tail
    )
  )



plt$theme = theme(
  axis.text.x = element_text(
    angle=45,
    hjust = 1 # define text position base point using its tail
    #用來調整詞的水平座標依據（旋轉的軸心在哪邊）
    #整條長度為零到一，越接近第一個字則越小，越接近最後則越接近一
    #另外也有vjust也就是調整垂直座標軸的依據
  )
)

plt$ggplot + plt$geoms + plt$theme

# 檢查圖形怪怪的，的問題
marriageTaoYuan |>
  purrr::map(class)
上方程式就是在檢查每一個資料的class


# 資料檢查的過程，檢查每一個class
#$statistic_yyy
#'character'
#$according
#'character'
#$site_id
#'character'
#$marriage_type
#'character'
#$female_age_or_spouse1
#'character'
#$male_age_or_spouse2
#'character'
#$marry_pair
#'character'
#$site_id2
# character'

# shift+commen+c就會有井字

marriageTaoYuan |>
  mutate(
    marry_pair = as.integer(marry_pair)
  ) -> marriageTaoYuan

plt$ggplot = ggplot(data=marriageTaoYuan)
plt$theme = theme(
  axis.text.x = element_text(
    angle=45, hjust=1
  )
)
plt$ggplot + plt$geoms +  plt$theme

marriageTaoYuan$female_age_or_spouse1 |>
  factor() |>
  levels() -> defaultLevels
lastIndex = length(defaultLevels)

c(
  defaultLevels[[lastIndex]], # "未滿15歲",
  defaultLevels[-lastIndex]
) -> correctLevels

marriageTaoYuan$female_age_or_spouse1 |>
  factor(
    levels=correctLevels
  ) -> marriageTaoYuan$female_age_or_spouse1

plt$ggplot = ggplot(data=marriageTaoYuan)
plt$theme = theme(
  axis.text.x = element_text(
    angle=45, hjust=1
  )
)
plt$ggplot + plt$geoms +  plt$theme


#作業：哪個行政區的女性較晚婚（30歲分界）




# 
# 
# 
