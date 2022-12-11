googledrive::drive_deauth()
googledrive::drive_download(
  file=googledrive::as_id("https://drive.google.com/file/d/1K8IWyy7G9LAKewjVXMGD8kUbbvjGoRT7/view?usp=sharing"),
  overwrite = T
)
marriage <- readr::read_csv("marriage.csv")


library(dplyr)
marriageTaoYuan = {
  marriage |>
    dplyr::filter(
      # 只看桃園市
      stringr::str_detect(site_id,"桃園市")
    ) -> marriageTaoYuan
  marriageTaoYuan |>
    # 創造行政區欄位
    mutate(
      site_id2 = stringr::str_sub(site_id,4,6)
    ) -> marriageTaoYuan
  
}

View(.Last.value)

# 結婚年齡
# X：以妻年齡來看
# Y：對數
library(ggplot2)
plt = Plot(data=marriageTaoYuan)
plt$ggplot = ggplot()
plt$geoms = list(
  geom_col(
    data=plt$data,
    mapping=aes(
      x=female_age_or_spouse1,
      y=marry_pair
    ),
    position="stack" # sum across sites within same age group.
  )
)
plt$make() + 
  theme(
    axis.text.x = element_text(
      angle=45,
      hjust = 1 # define text position base point using its tail
    )
  )

# marry_pair y weird
# check data frame
# Is class correct?
marriageTaoYuan |>
  purrr::map(class)
marriageTaoYuan |>
  mutate(
    marry_pair = as.integer(marry_pair)
  ) -> marriageTaoYuan
ggplot() +
  geom_col(
    data=marriageTaoYuan,
    mapping=aes(
      x=female_age_or_spouse1,
      y=marry_pair
    ),
    position="stack" # sum across sites within same age group.
  ) +
  theme(
    axis.text.x = element_text(
      angle=45,
      hjust = 1 # define text position base point using its tail
    )
  )






mutate(
    
  )

plot0 +
  theme(
    axis.text.x = 
    axis.text.x = element_text(
      angle=30
    )
  )

