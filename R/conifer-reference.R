#### COTOHA API client ####

#' Parsing Dependency Structure
#'
#' @param sentence string.
#' @param type string. Select `default` or `kuzure`.
#' @return list.
#'
#' @name parse
NULL

#' Named Entity Extraction
#'
#' @param sentence string.
#' @param type string. Select `default` or `kuzure`.
#'
#' @return list.
#'
#' @name ne
NULL

#' Reference Resolution
#'
#' @param document character.
#' @param type string. Select `default` or `kuzure`.
#' @param do_segment boolean. Default is false.
#'
#' @return list.
#'
#' @name coreference
NULL

#' Keyword Extraction
#'
#' @param documetn character.
#' @param type string. Select `default` or `kuzure`.
#' @param do_segment boolean. Default is false.
#'
#' @return list.
#'
#' @name keyword
NULL

#' Calculating Similarity between Sentences
#'
#' @param s1 string.
#' @param s2 string.
#' @param type string. Select `default` or `kuzure`.
#'
#' @return list.
#'
#' @name similarity
NULL

#' Linguistic Modality Detection
#'
#' @param sentence string.
#' @param type string. Select `default` or `kuzure`.
#'
#' @name sentence_type
NULL

#' Speaker's Characteristics Recognition
#'
#' @param document character.
#' @param do_segment boolean. Default is false.
#'
#' @return list.
#'
#' @name user_attribute
NULL

#' Removing Fillers of Sentence
#'
#' @param text string.
#' @param do_segment boolean. Default is false.
#'
#' @return list.
#'
#' @name remove_filler
NULL

#' Detecting Misrecognition of Sentence
#'
#' @param sentence string.
#'
#' @return list.
#'
#' @name detect_misrecognition
NULL

#' Sentiment Analysis
#'
#' @param sentence string.
#' @return list.
#'
#' @name sentiment
NULL

#### END ####
