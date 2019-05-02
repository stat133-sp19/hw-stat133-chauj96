source("/Users/Yujin/binomial/R/binomial.R")

context("check binomial functions")

# bin_choose()
test_that("check binomial choose function works well", {

  expect_equal(bin_choose(3, 1), 3)
  expect_error(bin_choose(3, 4))
  expect_length(bin_choose(4, 2), 1)
})

# bin_probability()
test_that("check binomial probability function works well", {

  expect_error(bin_probability(3, 2, 0.4))
  expect_error(bin_probability(2, 4, -0.3))
  expect_equal(bin_probability(3, 5, 0.7), 0.3087)
})

# bin_distribution()
test_that("check binomial distribution function works well", {

  expect_equal(nrow(bin_distribution(10, 0.5)), 11)
  expect_equal(ncol(bin_distribution(10, 0.5)), 2)
  expect_error(bin_distribution(10, 1.5))
})

# bin_cumulative()
test_that("check binomial cumulative function works well", {

  expect_equal(nrow(bin_cumulative(10, 0.5)), 11)
  expect_equal(ncol(bin_cumulative(10, 0.5)), 3)
  expect_error(bin_cumulative(10, 3))
})

