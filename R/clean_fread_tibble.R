#' Read, clean and convert
#'
#' The functions the very fast \code{fread} function form the \code{data.table} package. The columns of the resulting data table are made more r-friendly. In the end the data table is converted to a tibble.
#'
#' To make names more r-friendly the \code{clean_names} function from the \code{janitor} packege is used. It for example replaces "." and " " with "_" and converts names to lower case. This is the standard known as snake_case.
#'
#' @param .filename The path to the file that should be imported.
#' @param ... Additional arguments for the fread function.
#'
#' @importFrom magrittr %>%
#'
#' @return A data frame (with class tibble) that contains the content of the specified file.
#' @export
#'
#' @examples
#' \dontrun{
#' clean_fread_tibble("folder\filename")
#' }
clean_fread_tibble <-
function(.filename, ...){
  data.table::fread(.filename, ...)%>%
  janitor::clean_names()%>%
  tibble::as_tibble()
}
