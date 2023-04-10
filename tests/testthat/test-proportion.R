test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})



#' sample dataframe
data <- data.frame(
  c1 = c("a", "b", "c", "c", "c", "b", "b", "b"),
  c2 = c(1, 2, 3, 4, 5, 6, 7, 8)
)

test_that("input is not a dataframe", {
  expect_error(proportion('a', c2))
})

test_that("proportion() returns expected output", {
  result <- proportion(data, c1)
  expected <- dplyr::tibble(
    c1 = c("a", "b", "c"),
    Counts = c(1, 4, 3),
    Percent = c(12.5, 50, 37.5))
  expect_equal(result, expected)
})


test_that("proportion() throws error if input column does not exist", {
  expect_error(proportion(data, notacolumn))
})


