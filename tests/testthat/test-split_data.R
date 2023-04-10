# create a sample dataframe for testing
df <- data.frame(x = 1:10, y = rep(c("a", "b"), 5))

# test for input dataframe being of correct type
test_that("split_data() throws an error when data is not a data frame", {
  expect_error(split_data(1, 0.7, "y"), "data should be a data frame")
})

# test for proportion input being numeric
test_that("split_data() throws an error when proportion is not numeric", {
  expect_error(split_data(df, "notatprop", "y"), "proportion should be of type numeric")
})

# test for strata being of type character
test_that("split_data() throws an error when specified_strata is not a character", {
  expect_error(split_data(df, 0.7, 1), "specified_strata should be of type character")
})


# test for data being split correctly
test_that("split_data() correctly splits the data into training and testing datasets", {
  split_data(df, 0.7, "y")
  expect_true(is.data.frame(data_training))
  expect_true(is.data.frame(data_testing))
  expect_equal(nrow(df), nrow(data_training) + nrow(data_testing))

  expect_true(all(dplyr::semi_join(data_training, data.frame(df), by = names(data_training)) == data_training))
  expect_true(all(dplyr::semi_join(data_testing, data.frame(df), by = names(data_testing)) == data_testing))
})
