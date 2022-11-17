library(ggplot2)
library(showtext)
library(econDV2)
# add google font: Noto Sans TC for chinese characters
sysfonts::font_add_google('Noto Sans TC')
# turn on showing chinese text in graph device
showtext_auto()
# set our graph theme to use the google font and a classic white back ground
theme_set(
  theme(
    text=element_text(family = "Noto Sans TC")
  )+
    theme_classic()
)
# some handy tool to use later through out the class
ggenv=new.env()
ggenv$gg <- list(
  dash = econDV2::ggdash,
  geom = econDV2::ggbrowse,
  aes = econDV2::ggaes
)
attach(ggenv)


Sys.setenv(CLIPR_ALLOW=TRUE)

source(".Rprofile") # No need if you run in RStudio
Sys.setenv(CLIPR_ALLOW=TRUE) # if you use shiny app in Colab





plt$ggplot = ggplot(mpg, aes(y = class))
plt$geom =  geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE))
plt$ggplot+plt$geom

plt$geom =geom_bar(aes(fill = drv), position = position_stack())
plt$ggplot+plt$geom

# check data limits
mpg$drv |> unique() #看資料分幾類unique()
print(mpg,n=234)

plt$scale = scale_fill_manual(
  limits = c("f", "4", "r"),
  values = c("#ED90A4", "#7EBA68", "#6FB1E7")
)
plt$ggplot+plt$geom+plt$scale


