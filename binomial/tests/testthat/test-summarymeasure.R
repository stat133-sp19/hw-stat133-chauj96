source("/Users/Yujin/binomial/R/binomial.R")

context("check summary measure functions")

# aux_mean()
test_that("check aux mean function works well", {

  expect_equal(aux_mean(5, 0.1), 0.5)
  expect_gt(aux_mean(3, 0.2), 0.5)
  expect_lt(aux_mean(2, 0.1), 0.5)
})

# aux_variance()
test_that("check aux variance function works well", {

  expect_equal(aux_variance(3, 0.2), 0.48)
  expect_gt(aux_variance(3, 0.3), 0.3)
  expect_gte(aux_variance(3, 0.2), 0.48)
})

# aux_mode()
test_that("check aux mode function works well", {

  expect_equal(aux_mode(4, 0.2), 1)
  expect_gt(aux_mode(98, 0.2), 18)
  expect_lte(aux_mode(96, 0.78), 77)
})

# aux_skewness()
test_that("check aux skewness function works well", {

  expect_equal(aux_skewness(4, 0.2), 0.75)
  expect_equal(aux_skewness(42, 0.5), 0)
  expect_gte(aux_skewness(45, 0.3), 0.07)
})

# aux_kurtosis()
test_that("check aux kurtosis function works well", {

  expect_gt(aux_kurtosis(3, 0.9), 1.0)
  expect_lt(aux_kurtosis(54, 0.6), 0)
  expect_equal(aux_kurtosis(3, 0.9), 1,703704)
})
