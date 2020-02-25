#' Fast read, cleaning and conversion
#'
#' The functions uses data.tables fast \code{fread} function. The columns of the resulting data.table are made more r-friendly. In the end the data.table is converted to a tibble.
#'
#' @param .filename The path to the file that should be imported.
#' @param ... Additional arguments for the fread function.
#'
#' @import tidyverse, data.table, janitor
#'
#' @return A data frame (with class tibble) that contains the content of the file.
#' @export
#'
#' @examples
#' \dontrun{
#' clean_fread_tibble("folder\.filename")
#' }
clean_fread_tibble <-
function(.filename, ...){
  data.table::fread(.filename, ...)%>%
  janitor::clean_names()%>%
  tibble::as_tibble()
}
