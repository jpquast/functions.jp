#' Median normalisation
#'
#' Median normalise intensity values for all samples of mass spectrometry data. The intensity values are ideally log2 transformed. The output is a new column called normalised_intensity_log2.
#'
#' @param data A data frame containing at least sample names and intensity values.
#' @param file_column_name The name of the column containing the sample names.
#' @param intensity_column_name The name of the column containing the intensity values.
#' @param na.rm A logical indicating wther missing values should be removed.
#'
#' @import tidyverse
#'
#' @return A data frame that contains the input data and an additional column with normalised intensity values.
#' @export
#'
#' @examples
#' \dontrun{
#' median_normalisation(data, sample_name, intensity_log2, na.rm = TRUE)
#' }
median_normalisation <-
function(data, file_column_name, intensity_column_name, na.rm = FALSE){
  data %>%
    group_by({{file_column_name}})%>%
    mutate(median_run_intensity = median({{intensity_column_name}}, na.rm = na.rm))%>%
    ungroup()%>%
    mutate(median_intensity = median(unique(median_run_intensity), na.rm = na.rm))%>%
    mutate(normalised_intensity_log2 = {{intensity_column_name}}/median_run_intensity*median_intensity)%>%
    select(- median_run_intensity, -median_intensity)
}
