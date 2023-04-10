test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


# create a sample dataframe for testing
df <- data.frame(x = 1:10, y = rep(c("a", "b"), 5))

# df <- data.frame(Year = c(2002,2003,2009,2011,2012,2016,2017),
#                  Player = c("Kevin Durant", "Kobe Bryant", "Michael Jordan", "Shaq O'neil",
#                             "Steph Curry", "Yao Ming","Ray Nguyen"),
#                  Height = c(190,191,192,194,200,210,170))


test_that("split_data() throws an error when data is not a data frame", {
  expect_error(split_data(1, 0.7, "y"), "data should be a data frame")
})

test_that("split_data() throws an error when proportion is not numeric", {
  expect_error(split_data(df, 'notatprop', "y"), "proportion should be of type numeric")
})

test_that("split_data() throws an error when specified_strata is not a character", {
  expect_error(split_data(df, 0.7, 1), "specified_strata should be of type character")
})

test_that("split_data() correctly splits the data into training and testing datasets", {
  split_data(df, 0.7, "y")
  expect_true(is.data.frame(data_training))
  expect_true(is.data.frame(data_testing))
  expect_equal(nrow(df), nrow(data_training) + nrow(data_testing))

  expect_true(all(dplyr::semi_join(data_training, data.frame(df), by = names(data_training)) == data_training))
  expect_true(all(dplyr::semi_join(data_testing, data.frame(df), by = names(data_testing)) == data_testing))
})





#' #' @examples
#' #' split_data(mtcars,0.7,"vs")
#' split_data <- function(data,proportion,specified_strata) {
#'   if (!is.data.frame(data)) {
#'     stop("data should be a data frame")
#'   }
#'   if (!is.numeric(proportion)) {
#'     stop("proportion should be of type numeric")
#'   }
#'   if (!is.character(specified_strata)) {
#'     stop("specified_strata should be of type character")
#'   }
#'   data_split <- rsample::initial_split(data, prop = proportion, strata = specified_strata)
#'   data_training <<- rsample::training(data_split)
#'   data_testing <<- rsample::testing(data_split)
#' }
