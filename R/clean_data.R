#' Filters dataset using a year range and removes NA values
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
#' #clean_data(df,Year,2010,2019)
clean_data <- function(data, col, from, to) {
  #stopifnot(is.data.frame(data))
  if (!is.numeric(from) | !is.numeric(to)) {
    stop("from or to should be of type numeric")
  }
  data %>% dplyr::filter({{col}} >= from & {{col}} <= to) %>%
    dplyr::filter(Player != "0") %>%
    dplyr::select(Year, Player, MIN, PTS, FGM, FGA, FTM, FTA, TOV, Is_All_Star)
}
