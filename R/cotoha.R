#' COTOHA Client Class.
#'
#' @name cotoha_client
#' @noRd
Client <- R6::R6Class("CotohaClient",
  public = list(
    config = list(
      access_token = NULL,
      base_url = NULL
    ),
    initialize = function(access_token, base_url) {
      self$config <- list(
        access_token = access_token,
        base_url = base_url
      )
    },
    parse = function(sentence, type = c("default", "kuzure")) {
      private$request(
        private$getEndpoint("parse"),
        sentence,
        type
      )
    },
    ne = function(sentence, type = c("default", "kuzure")) {
      private$request(
        private$getEndpoint("ne"),
        sentence,
        type
      )
    },
    coreference = function(document, type = c("default", "kuzure"), do_segment = FALSE) {
      stopifnot(typeof(document) == "character")
      body <- list(
        document = paste(document),
        type = rlang::arg_match(type, c("default", "kuzure")),
        do_segment = do_segment
      )
      res <- httr::POST(
        private$getEndpoint("coreference"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    keyword = function(document, type = c("default", "kuzure"), do_segment = FALSE, max_keyword_num = 5L) {
      stopifnot(typeof(document) == "character")
      body <- list(
        document = paste(document),
        type = rlang::arg_match(type, c("default", "kuzure")),
        do_segment = do_segment,
        max_keyword_num = max_keyword_num
      )
      res <- httr::POST(
        private$getEndpoint("keyword"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    similarity = function(s1, s2, type = c("default", "kuzure")) {
      stopifnot(typeof(s1) == "character", typeof(s2) == "character")
      body <- list(
        s1 = paste(s1, collapse = " "),
        s2 = paste(s2, collapse = " "),
        type = rlang::arg_match(type, c("default", "kuzure"))
      )
      res <- httr::POST(
        private$getEndpoint("similarity"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    sentence_type = function(sentence, type = c("default", "kuzure")) {
      private$request(
        private$getEndpoint("sentence_type"),
        sentence,
        type
      )
    },
    user_attribute = function(document, do_segment = FALSE) {
      stopifnot(typeof(document) == "character")
      body <- list(
        document = paste(document),
        do_segment = do_segment
      )
      res <- httr::POST(
        private$getEndpoint("user_attribute"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    remove_filler = function(text, do_segment = FALSE) {
      stopifnot(typeof(text) == "character")
      body <-
        list(
          text = paste(text, collapse = " "),
          do_segment = do_segment
        )
      res <- httr::POST(
        private$getEndpoint("remove_filler"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    detect_misrecognition = function(sentence) {
      stopifnot(typeof(sentence) == "character")
      body <-
        list(sentence = paste(sentence, collapse = " "))
      res <- httr::POST(
        private$getEndpoint("detect_misrecognition"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    sentiment = function(sentence) {
      stopifnot(typeof(sentence) == "character")
      body <-
        list(sentence = paste(sentence, collapse = " "))
      res <- httr::POST(
        private$getEndpoint("sentiment"),
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    }
  ),
  private = list(
    request = function(endpoint, sentence, type) {
      stopifnot(typeof(sentence) == "character")
      body <-
        list(
          sentence = paste(sentence, collapse = " "),
          type = rlang::arg_match(type, c("default", "kuzure"))
        )
      res <- httr::POST(
        endpoint,
        body = body,
        encode = "json",
        content_type = "application/json;charset=UTF-8",
        httr::add_headers(Authorization = paste("Bearer", self$config$access_token))
      )
      content <- httr::content(res)
      if (res$status_code == 200) {
        return(content$result)
      } else {
        message(content$message)
        return(NULL)
      }
    },
    getEndpoint = function(api_name) {
      api <- dplyr::case_when(
        api_name == "parse" ~ "/nlp/v1/parse",
        api_name == "ne" ~ "/nlp/v1/ne",
        api_name == "coreference" ~ "/nlp/v1/coreference",
        api_name == "keyword" ~ "/nlp/v1/keyword",
        api_name == "similarity" ~ "/nlp/v1/similarity",
        api_name == "sentence_type" ~ "/nlp/v1/sentence_type",
        api_name == "user_attribute" ~ "/nlp/beta/user_attribute",
        api_name == "remove_filler" ~ "/nlp/beta/remove_filler",
        api_name == "detect_misrecognition" ~ "/nlp/beta/detect_misrecognition",
        api_name == "sentiment" ~ "/nlp/v1/sentiment",
        TRUE ~ ""
      )
      return(paste0(self$config$base_url, api))
    }
  )
)

#' COTOHA API Client
#'
#' Return client class object.
#'
#' @param access_token string.
#' @param base_url string.
#'
#' @return R6 class object having methods below.
#' \itemize{
#'   \item parse(): Parsing dependency structure
#'   \item ne(): Named entity extraction
#'   \item coreference(): Reference resolution
#'   \item keyword(): Keyword extraction
#'   \item similarity(): Calculating similality between sentences
#'   \item sentence_type(): Linguistic modality detection
#'   \item user_attribute(): Speaker's characteristics recognition
#'   \item remove_filler(): Removing fillers of sentence
#'   \item detect_misrecognition(): Detecting misrecognition of sentence
#'   \item sentiment(): Sentiment analysis
#' }
#'
#' @seealso \url{https://api.ce-cotoha.com/contents/reference/apireference.html}
#'
#' @export
cotoha <- function(access_token, base_url = "https://api.ce-cotoha.com/api/dev") {
  stopifnot(typeof(access_token) == "character")
  return(Client$new(access_token, base_url))
}


#' Getting Access Token of COTOHA API
#'
#' @seealso \url{https://api.ce-cotoha.com/contents/reference/accesstoken.html}
#'
#' @param publish_url string.
#' @param client_id string.
#' @param client_secret string.
#' @param grant_type string.
#'
#' @return return access token only when the authorization succeeded.
#' If failed, then return the httr response invisibly.
#'
#' @export
getAccessToken <- function(publish_url,
                           client_id = Sys.getenv("COTOHA_ID"),
                           client_secret = Sys.getenv("COTOHA_SECRET"),
                           grant_type = "client_credentials") {
  config <- list(
    grantType = grant_type,
    clientId = client_id,
    clientSecret = client_secret
  )

  res <- httr::POST(
    url = publish_url,
    body = config,
    encode = "json",
    content_type = "application/json",
    httr::verbose()
  )

  if (res$status_code == 201) {
    content <- httr::content(res)
    return(content$access_token)
  } else {
    message("Authentication failed")
    return(invisible(res))
  }
}
