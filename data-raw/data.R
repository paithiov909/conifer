# ldccr::aozora(
#     "https://www.aozora.gr.jp/cards/000081/files/46605_ruby_29758.zip",
#     directory = "data-raw"
#)

yamanashi <- readr::read_lines("data-raw/yamanashi.txt") %>%
    purrr::discard(~ .x == "")

usethis::use_data(yamanashi, overwrite = TRUE)
