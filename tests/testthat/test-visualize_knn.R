
# helper data
data <- data.frame(k = 1:10,
                   acc = 20:11)

# testing data frame input error
test_that("data is dataframe", {
  expect_error(visualize_knn(9, k, acc, "test title"), "data should be a data frame")
})


# testing input title is of type character/string
test_that("input title is not a character", {
  expect_error(visualize_knn(data, k, acc, 2), "title should be of type string/character")
})


## testing output object if of type ggplot
test_that("visualize_knn() output is a ggplot object", {
  plot <- visualize_knn(data, k, acc, "test title")
  expect_true("ggplot" %in% class(plot))
})

#testing for the correct data being on each axis og ggplot object
test_that("visualize_knn() output has correct data per axis", {
  plot <- visualize_knn(data, k, acc, "test title")
  expect_equal(ggplot2::ggplot_build(plot)$data[[1]]$x, data$k)
  expect_equal(ggplot2::ggplot_build(plot)$data[[1]]$y, data$acc)
  })

# test for title being set correctly
test_that("visualize_knn() output has correct title", {
  plot <- visualize_knn(data, k, acc, "test title")
  actual_title <- plot$labels$title
  expect_equal(actual_title, "test title")
})

