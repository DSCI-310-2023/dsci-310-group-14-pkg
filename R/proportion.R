#' Return a proportion of a specified column
#'
#' @param data Specified dataframe
#' @param column Specified column to apply function on
#'
#' @return A summary dataframe containing proportion of specified column
#' @export
#'
#' @examples
#' #prop <- proportion(dataframe,Is_All_Star)
proportion <- function(data,column) {

  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.character(column)) {
    stop("column should be of type string/character")
  }
  proportion <- dplyr::group_by(data,{{column}}) %>%
  dplyr::summarize(Counts = n()) %>%
  dplyr::mutate(Percent = 100*Counts/nrow(data))
}
