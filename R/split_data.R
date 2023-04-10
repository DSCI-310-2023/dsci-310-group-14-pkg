#' Splits dataset into a training and testing dataset and saves it into 2 global variable
#'
#' @param data Specified dataframe
#' @param proportion Specified split proportion
#' @param specified_strata Specified variable that you are prediciting for
#'
#' @return function saves final dataframe into two global variables "data_testing", "data_training"
#' @export
#'
#' @examples
#' split_data(mtcars, 0.7, "vs")
split_data <- function(data, proportion, specified_strata) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.numeric(proportion)) {
    stop("proportion should be of type numeric")
  }
  if (!is.character(specified_strata)) {
    stop("specified_strata should be of type character")
  }
  data_split <- rsample::initial_split(data, prop = proportion, strata = specified_strata)
  data_training <<- rsample::training(data_split)
  data_testing <<- rsample::testing(data_split)
}
