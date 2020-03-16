library(tidyverse)

rjavacmecab::aozora(
    "https://www.aozora.gr.jp/cards/000081/files/46605_ruby_29758.zip",
    directory = "tools"
)

yamanashi <- readr::read_lines("tools/yamanashi.txt") %>%
    purrr::discard(~ .x == "")

usethis::use_data(yamanashi)
