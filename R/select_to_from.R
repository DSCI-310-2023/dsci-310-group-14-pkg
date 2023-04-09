#' Filters dataset using a specified range on specific column
#'
#' @param data Specified dataframe
#' @param col Specified variable to filter on
#' @param from Starting point
#' @param to Ending point
#'
#' @return A filtered dataframe
#' @export
#'
#' @examples
#' select_to_from(mtcars,mpg,21,22.8)
select_to_from <- function(data, col, from, to) {
  stopifnot(is.data.frame(data))
  if (!is.numeric(from) | !is.numeric(to)) {
    stop("from or to should be of type numeric")
  }
  data %>% dplyr::filter({{col}} >= from & {{col}} <= to)
}
