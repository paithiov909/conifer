#' Prettify Parsed Chunks
#'
#' @param li List. Output of \code{client$parse()}.
#' @return tibble.
#'
#' @export
pretty_chunks <- function(li) {
  df <-
    purrr::map_dfr(li, function(chunk) {
      purrr::map_dfr(
        chunk$tokens,
        ~ data.frame(
          chunk_id = chunk$chunk_info$id,
          head = chunk$chunk_info$head,
          dep = chunk$chunk_info$dep,
          chunk_head = chunk$chunk_info$head,
          chunk_func = chunk$chunk_info$chunk_func,
          token_id = .$id,
          form = .$form,
          pos = .$pos,
          features = paste0(purrr::flatten_chr(.$features), collapse = ","),
          attributes = paste0(purrr::flatten_chr(.$attributes), collapse = ",")
        )
      )
    }) %>%
    dplyr::mutate(across(where(is.character), ~ dplyr::na_if(., "")))

  return(tibble::as_tibble(df))
}
