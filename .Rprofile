

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
ggenv=new.env() #創造一個新的環境
ggenv$gg <- list(
  dash = econDV2::ggdash,
  geom = econDV2::ggbrowse,
  aes = econDV2::ggaes
)
attach(ggenv)#放到一個程式碼裡面叫gg


Plot <- function(data) {
  plot <- list(
    data = data,
    ggplot = NULL,
    geoms = NULL,
    make = function() {
      plot$ggplot + plot$geoms
    },
    save = function() {
      saveRDS(plot, filename)
      message(paste("The plot is saved at ", filename))
    }
  )
  return(plot) #小寫plot，代表大的Plot底下的一個情境
}


