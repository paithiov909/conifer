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



#### elasticlunr.js ####

#' Add Documents
#'
#' Add documents to index.
#'
#' @param doc tibble of which the first column represents document id
#' and the second column represents document body.
#'
#' @name add
NULL

#' Remove Documents
#'
#' Remove documents from index.
#'
#' @param doc tibble of which the first column represents document id
#' and the second column represents document body.
#'
#' @name remove
NULL

#' Update Documents
#'
#' Update documents in index.
#'
#' @param doc tibble of which the first column represents document id
#' and the second column represents document body.
#'
#' @name update
NULL

#' Search Document
#'
#' Search document of index.
#'
#' @param query List of query strings.
#' @param expand boolean. If true, it will expand a query token to increase recall.
#' Default is FALSE.
#' @param boolean Boolean logic setting string. "OR" or "AND" is acceptable. Default is "OR".
#' @param boost Used for Query-Time Boosting setting.
#' So that each documents of the index has only one value field, you do not have to change this value.
#'
#' @name search
NULL



#### TextMiner ####

#' Add a Single Document
#'
#' Add a single document to the corpus.
#'
#' @param doc string.
#' @name addDoc
NULL

#' Add Documents
#'
#' Add a collection of documents (in form of an array of strings) to the corpus.
#'
#' @param docs character.
#' @name addDocs
NULL

#' Strip Extra Whitespace
#'
#' Strip extra whitespace from all documents, leaving only at most one whitespace between any two other characters.
#'
#' @name clean
NULL

#' Remove Interpunctuation
#'
#' Remove interpunctuation characters (! ? . , ; -) from all documents.
#'
#' @name removeInterpunctuation
NULL

#' Remove Newline Characters
#'
#' Remove newline characters from all documents.
#'
#' @name removeNewLines
NULL

#' Remove Supplied Words
#'
#' Remove all words in the supplied `stop_words` array from all documents.
#'
#' @param stop_words characters.
#' @param case_insensitive boolean. Default is false.
#' @name removeWords
NULL

#' Remove Digits
#'
#' Remove any digits occuring in the texts.
#'
#' @name removeDigits
NULL

#' Remove Invalid Characters
#'
#' Remove all characters which are unknown or unrepresentable in Unicode.
#'
#' @name removeInvalidCharacters
NULL

#' Stemming of the Words
#'
#' Perform stemming of the words in each document. Two stemmers are supported: Porter and Lancaster.
#'
#' @param type string. Select `Porter` or `Lancaster`. Default is `Porter`.
#' @name stem
NULL

#' Convert Characters Lower-case
#'
#' Convert all characters in the documents to lower-case.
#'
#' @name toLower
NULL

#' Convert Characters Upper-case
#'
#' Convert all characters in the documents to upper-case.
#'
#' @name toUpper
NULL

#' Strip off Whitespace
#'
#' Strip off whitespace at the beginning and end of each document.
#'
#' @name trim
NULL

#' Create Document-Term-Matrix
#'
#' This function assigns documemt-term-matrix (DTM) to variable on R environment.
#' The DTM is weighted with TF-IDF. Each DTM is a list that has properties below.
#' \itemize{
#'   \item vocabulary
#'   \item data
#'   \item nDocs
#'   \item nTerms
#' }
#'
#' @param dtm_name string. variable name that the DTM will be assigned.
#' @param percent integer. Function removes all words from the DTM which appear in less than `percent` of the documents.
#' @seealso \url{https://github.com/Planeshifter/text-miner#documenttermmatrix--termdocumentmatrix}
#' @name documentTermMatrix
NULL

#' Replace English Contractions
#'
#' Replace all occuring English contractions by their expanded equivalents, e.g. "don't" is changed to "do not".
#'
#' @name expandContractions
NULL

#### END ####
