#' Planeshifter/text-miner V8 binding
#'
#' @name text_miner
#'
#' @import R6
#' @import V8
#' @noRd
TextMiner <- R6::R6Class("TextMiner",
  public = list(
    ctx = NULL,
    initialize = function(ctx) {
      self$ctx <- ctx
    },
    addDoc = function(doc) {
      self$ctx$assign("doc", doc)
      self$ctx$eval("corpus.addDoc(doc)")
      invisible(doc)
    },
    addDocs = function(docs) {
      self$ctx$assign("docs", docs)
      self$ctx$eval("corpus.addDocs(docs)")
      invisible(docs)
    },
    clean = function() {
      self$ctx$eval("corpus.clean()")
      invisible(NULL)
    },
    removeInterpunctuation = function() {
      self$ctx$eval("corpus.removeInterpunctuation()")
      invisible(NULL)
    },
    removeNewLines = function() {
      self$ctx$eval("corpus.removeNewlines()")
      invisible(NULL)
    },
    removeWords = function(stop_words, case_insensitive = FALSE) {
      self$ctx$assign("case_insensitive", case_insensitive)
      self$ctx$assign("stop_words", stop_words)
      self$ctx$eval("corpus.removeWords(stop_words, case_insensitive)")
      invisible(NULL)
    },
    removeDigits = function() {
      self$ctx$eval("corpus.removeDigits()")
      invisible(NULL)
    },
    removeInvalidCharacters = function() {
      self$ctx$eval("corpus.removeInvalidCharacters()")
      invisible(NULL)
    },
    stem = function(type = c("Porter", "Lancaster")) {
      self$ctx$assign("stem_type", type[1])
      self$ctx$eval("corpus.stem(stem_type)")
      invisible(NULL)
    },
    toLower = function() {
      self$ctx$eval("corpus.toLower()")
      invisible(NULL)
    },
    toUpper = function() {
      self$ctx$eval("corpus.toUpper()")
      invisible(NULL)
    },
    trim = function() {
      self$ctx$eval("corpus.trim()")
      invisible(NULL)
    },
    documentTermMatrix = function(dtm_name = "dtm", percent = 0L) {
      self$ctx$assign("dtm_name", dtm_name)
      self$ctx$assign("percent", percent)
      self$ctx$eval(paste(
        "console.r.assign(
            dtm_name,
            tm.documentTermMatrix(corpus)
                .removeSparseTerms(percent)
                .fill_zeros()
                .weighting(tm.weightTfIdf)
            )"
      ))
      invisible(NULL)
    },
    expandContractions = function() {
      self$ctx$eval("corpus.map(tm.expandContractions)")
      invisible(NULL)
    }
  )
)

#' Create Corpus with text-miner
#'
#' Return an Planeshifter/text-miner V8 binding.
#'
#' @param ctx Your own V8 context if any.
#'
#' @return R6 class object having methods below.
#' \itemize{
#'   \item addDoc()
#'   \item addDocs()
#'   \item clean()
#'   \item removeInterpunctuation()
#'   \item removeNewlines()
#'   \item removeWords()
#'   \item removeDigits()
#'   \item removeInvalidCharacters()
#'   \item stem()
#'   \item toLower()
#'   \item toUpper()
#'   \item trim()
#'   \item documentTermMatrix()
#'   \item expandContractions()
#' }
#'
#' @seealso \url{https://github.com/Planeshifter/text-miner}
#'
#' @import V8
#' @export
text_miner <- function(ctx = NULL) {
  if (is.null(ctx)) {
    ctx <- V8::v8()
    ctx$source(file.path(
      system.file(package = "conifer"),
      "js",
      "textminer.bundle.js"
    ))
  } else {
    ctx <- ctx
  }
  return(TextMiner$new(ctx))
}
