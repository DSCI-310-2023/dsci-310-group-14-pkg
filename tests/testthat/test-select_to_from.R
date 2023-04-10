# creating sample test data
data <- data.frame(Year = c(2002,2003,2009,2011,2012,2016,2017),
                   Player = c("Kevin Durant", "Kobe Bryant", "Michael Jordan", "Shaq O'neil",
                              "Steph Curry", "Yao Ming","Ray Nguyen"),
                   Height = c(190,191,192,194,200,210,170))


# test for input for data bein a dataframe
test_that("check [data] input not a data frame", {
  expect_error(select_to_from(notadf, Year, 2000, 2005))
})

# test for input column being in data
test_that("check for [col] when column does not exist in [data]", {
  expect_error(select_to_from(data, notacolumn, 2000, 2005))
})

# test for start of range input being numeric
test_that("check for [from] when not numeric", {
  expect_error(select_to_from(data, Year, '2000', 2005), "from or to should be of type numeric")
})

# test for end of range input being numeric
test_that("check for [to] when not numeric", {
  expect_error(select_to_from(data, Year, 2000, '2005'), "from or to should be of type numeric")
})


# test for data frame being filtered properly
test_that("select_to_from() produces the expected output", {
  result <- select_to_from(data, Height, 170, 205)
  expected <- data.frame(
    Year = c(2002,2003,2009,2011,2012,2017),
    Player = c("Kevin Durant", "Kobe Bryant", "Michael Jordan", "Shaq O'neil",
               "Steph Curry","Ray Nguyen"),
    Height = c(190,191,192,194,200, 170)
  )
  expect_equal(result, expected)
})


