#' elasticlunr.js V8 binding
#'
#' @name index
#'
#' @import R6
#' @import V8
#' @importFrom tibble tibble
#' @importFrom dplyr select
#' @noRd
Index <- R6::R6Class("Index",
    public = list(
        ctx = NULL,
        initialize = function(ctx) {
            self$ctx <- ctx
        },
        add = function(doc = tibble::tibble()) {
            df <- private$castTbl(doc)
            self$ctx$assign("df", df)
            self$ctx$eval("df.map(el => {
                elasticlunr.addDoc(el)
            })")
            invisible(df)
        },
        remove = function(doc = tibble::tibble()) {
            df <- private$castTbl(doc)
            self$ctx$assign("df", df)
            self$ctx$eval("df.map(el => {
                elasticlunr.removeDoc(el)
            })")
            invisible(df)
        },
        update = function(doc = tibble::tibble()) {
            df <- private$castTbl(doc)
            self$ctx$assign("df", df)
            self$ctx$eval("df.map(el => {
                elasticlunr.updateDoc(el)
            })")
            invisible(df)
        },
        search = function(query = list(),
                          expand = FALSE,
                          boolean = c("OR", "AND"),
                          boost = 1L) {
            self$ctx$assign("query", paste(query, collapse = " "))
            self$ctx$assign("config",
                            tibble::tibble(
                                expand = c(expand),
                                boolean = c(boolean[1]),
                                boost = c(boost)
                            ))
            return(
                self$ctx$get(
                    "elasticlunr.search(query, { fields: { body: { boost: config[0].boost }, }, expand: config[0].expand, bool: config[0].boolean })"
                )
            )
        }
    ),
    private = list(
        castTbl = function(tbl) {
            len <- colnames(tbl)
            if (length(len) < 2) {
                message("document must consists of at least 2 columns.")
                return(tibble::tibble())
            } else {
                df <- dplyr::select(tbl, 1:2)
                colnames(df) <- c("id", "body")
                return(df)
            }
        },
        getFields = function() {
            return(self$ctx$get("elasticlunr.getFields()"))
        }
    )
)

#' Create Documents Index with elasticlunr.js
#'
#' Return an elasticlunr.js V8 binding.
#'
#' @param ctx Your own V8 context if any.
#'
#' @return R6 class object having methods below.
#' \itemize{
#'   \item add(): Add documents to index.
#'   \item remove(): Remove documents from index.
#'   \item update(): Update documents in index.
#'   \item search(): Search document of index.
#' }
#'
#' @import V8
#' @export
elasticlunr <- function(ctx = NULL)
{
    if (is.null(ctx)) {
        ctx <- V8::v8()
        ctx$source(file.path(
            system.file(package = "conifer"),
            "js",
            "elasticlunr.bundle.js"
        ))
    } else {
        ctx <- ctx
    }
    return(Index$new(ctx))
}
