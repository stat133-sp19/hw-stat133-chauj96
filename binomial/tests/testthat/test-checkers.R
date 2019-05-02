source("/Users/Yujin/binomial/R/binomial.R")

context("check private checker")

# check_prob()
test_that("check probability function works well", {

  expect_true(check_prob(0.5))
  expect_length(check_prob(1), 1)
  expect_error(check_prob(1.2))
})

# check_trials()
test_that("check trial function works well", {

  expect_true(check_trials(5))
  expect_length(check_trials(3), 1)
  expect_error(check_trials(-1))
})

# check_success()
test_that("check success function works well", {

  expect_true(check_success(2, 3))
  expect_length(check_success(2, 3), 1)
  expect_error(check_success(4, 3))
})


