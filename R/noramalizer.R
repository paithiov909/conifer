#' Normalize Text on V8 Context
#'
#' @param str string.
#' @return normalized text.
#'
#' @seealso \url{https://github.com/moznion/neologd-normalizer-js}
#'
#' @import V8
#' @export
normalize <- function(str) {
  ctx <- V8::v8()
  ctx$source(file.path(
    system.file(package = "conifer"),
    "js",
    "normalizer.bundle.js"
  ))
  ctx$assign("str", str)
  ctx$eval("normalizer.normalize(str)")
}
