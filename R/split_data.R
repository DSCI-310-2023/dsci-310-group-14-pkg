#' Splits dataset into a training and testing dataset and writes it to a CSV
#'
#' @param data Specified dataframe
#' @param proportion Specified split proportion
#' @param specified_strata Specified variable that you are prediciting for
#'
#' @return function writes final dataframe into two dataframe
#' @export
#'
#' @examples
#' #split_data(dataset,0.7,"Is_All_Star")
split_data <- function(data,proportion,specified_strata) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.numeric(proportion)) {
    stop("proportion should be of type numeric")
  }
  if (!is.character(specified_strata)) {
    stop("specified_strata should be of type string/character")
  }
  data_split <- rsample::initial_split(data, prop = proportion, strata = specified_strata)
  data_training <- rsample::training(data_split)
  data_testing <- rsample::testing(data_split)
  readr::write_csv(data_training,file = here::here("data/processed/training_set.csv"))
  readr::write_csv(data_testing,file = here::here("data/processed/testing_set.csv"))
}
