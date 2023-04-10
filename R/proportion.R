#' Return a proportion of a specified column
#'
#' @param data Specified dataframe
#' @param column Specified column to apply function on
#'
#' @return A summary dataframe containing proportion of specified column in percentage
#' @export
#'
#' @examples
#' proportion(mtcars, vs)
proportion <- function(data, column) {
  stopifnot(is.data.frame(data))
  dplyr::group_by(data, {{ column }}) %>%
    dplyr::summarize(Counts = dplyr::n()) %>%
    dplyr::mutate(Percent = 100 * Counts / nrow(data))
}
