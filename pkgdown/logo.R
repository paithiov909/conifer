library(usethis)
library(pkgdown)
library(hexSticker)

img <- file.path(
  getwd(),
  "man",
  "figures",
  "botanical.svg"
)

hexSticker::sticker(
  img,
  s_x = 1,
  s_width = .5,
  s_height = .5,
  p_size = 28,
  package = "conifer",
  p_color = "#0a0f01",
  h_size = 2.4,
  h_fill = "#a4f31c",
  h_color = "#f36b1c",
  spotlight = TRUE,
  filename = "man/figures/logo-origin.png"
)

use_logo("man/figures/logo-origin.png")
build_favicons()
