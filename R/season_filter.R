#' Filters dataset using a year range
#'
#' @param data Specified dataframe
#' @param col Specified year column to filter on
#' @param from Starting year
#' @param to Ending year
#'
#' @return A filtered dataframe
#' @export
#'
#' @examples
#' select_data <- season_filter(data, Year, 2011, 2015)
season_filter <- function(data, col, from, to) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.numeric(from) | !is.numeric(to)) {
    stop("from or to should be of type numeric")
  }
  data %>% dplyr::filter({{col}} >= from & {{col}} <= to)
}
