# -*- coding: utf-8 -*-
"""week 9.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/12cVQh5yoFUA9VK_CX469VFMsKSE8N7Xj

# .Rprofile
"""

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

"""# Correction

 * <https://colab.research.google.com/drive/1VMhQSqQT4EFG4JsbHmeo8hKOqpXFG7cY#scrollTo=GSQN4Kzj3HcH>

# Setup
"""

source(".Rprofile") # No need if you run in RStudio
Sys.setenv(CLIPR_ALLOW=TRUE) # if you use shiny app in Colab

"""# Color

[reference](https://ggplot2-book.org/scale-colour.html)

  * Hue (色像）
  * Chroma（彩度）
  * Luminance（流明）

## Purpose

  * Qualitative: via **Hue** variation. 

<img style="display:inline-block;" src="https://goodly.co.in/wp-content/uploads/2015/05/Worlds-Biggest-Economies-Reworked-Chart-2.png" width="50%">
<img style="display:inline-block;"  src="https://www.economist.com/img/b/400/795/90/media-assets/image/20221029_WBC484.png" width="30%">

  * Quantitative 

  流明產生越白的顏色所代表的值越低。

    * Sequential: one dimension from low to high, via **Luminance** variation.
<img src="https://www.economist.com/sites/default/files/20181020_WOC443_0.png" width="50%">
    * Diverging: how far from the central.  
<img src="https://udn.com/vote2020/img/chart/img1-1.png" width="30%">

# Qualitative
**bold text**
"""

plt = Plot()
plt$ggplot = ggplot(mpg, aes(y = class))
plt$geom =  geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) 
plt$make()

plt$geom =geom_bar(aes(fill = drv), position = position_stack())
plt$make()

# check data limits
mpg$drv |> unique()

"""## Map limits to values

`aes(fill=drv)` is related to 
`scale_fill_xxx`
"""

plt$scale = scale_fill_manual(
   limits = c("f", "4", "r"),
   values = c("#ED90A4", "#7EBA68", "#6FB1E7")
)

plt$make()

"""## limits also determine order"""

plt$scale = scale_fill_manual(
   limits = c("r", "f", "4"), 
   values = c("#ED90A4", "#7EBA68", "#6FB1E7")
)

plt$make()

"""## Outside limits is considered NA"""

plt$scale = scale_fill_manual(
   limits = c("r", "f"), 
   values = c("#ED90A4", "#7EBA68")
)
plt$make()

plt$scale = scale_fill_manual(
   limits = c("r", "f"), 
   values = c("#ED90A4", "#7EBA68"),
   na.value = "transparent" # decides na.values
)
plt$make()

"""##  Lengend: name, breaks, labels

![image.png](data:image/png;base64,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)
"""

plt$scale = list(
  scale_fill_manual(
    limits=c("r", "f"),values=c("#ED90A4", "#7EBA68"),na.value = "transparent",
    labels=c("休旅車","四輪驅動"), name="車種"),
  scale_y_discrete(
    limits=c("subcompact", "suv"), 
    labels=c("中型", "SUV"), name="車型")
  )


plt$make()

"""# Final makeup


"""

plt$others = list(
  scale_x_continuous(sec.axis = dup_axis(),
    expand=c(0,0)
  )
)

mk = econDV2::Makeup()
plt$theme = list(
  mk$theme(),
  theme(
    panel.grid.major.y= element_blank(),
    panel.grid.major.x=element_line(color="grey"),
    legend.position = "top",
    axis.title.y=element_text(angle = 0)
  )
)

plt$explain = list(
  labs(
    title="不同車型/車種數量",
    subtitle="去除部份車型/車種",
    caption="資料來源：",
    tag="圖1"
  ),
  xlab(NULL)
)
plt$make()

plt$make()+
  theme(
  plot.title=element_text(size = 10 #input$title
   ),
  plot.subtitle = element_text(size= 10 #input$subtitle
   ),
  plot.caption = element_text(size=10 #input$caption
   )
  )

econDV2::ggdash()

"""# Gallery

  * App: <https://tpemartin.github.io/data-visual-gallery/> 

  * [graph upload form](https://docs.google.com/forms/d/e/1FAIpQLSeCeHW-NAJeep1b_8jep-ipKVrLAW3jfLidR26Rb34jW0WC5Q/viewform)
"""