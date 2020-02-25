#' Read uniprot FASTA file
#'
#' This function is able to read a proteome FASTA file from uniprot.
#'
#' @param .filename The path to the FASTA file that should be imported.
#'
#' @return A data frame that contains a column with the uniprot ID and a column with the sequence of the protein.
#' @export
#'
#' @examples
#' \dontrun{
#' median_normalisation("folder\filename.FASTA")
#' }
read_proteom_from_fasta <-
function(.filename){
  # define global variables to prevent notes in function check
  uniprot_id <- sequence <- seq_name <- seq_text <-  NULL
  # main function
  phylotools::read.fasta(.filename)%>%
  janitor::clean_names()%>%
  dplyr::mutate(uniprot_id = stringr::str_extract(seq_name, "\\|.*?\\|")%>% stringr::str_extract("(\\w){1,}"))%>%
  dplyr::mutate(sequence = seq_text)%>%
  dplyr::select(-seq_name, -seq_text)
}
