context("Test Checkers")

test_that("check_prob with valid number",{

  expect_true(check_prob(0.5))
  expect_length(check_prob(0.5),1)
  expect_true(check_prob(1))
})

test_that("check_prob fails with invalid number input",{

  expect_error(check_prob(-1))
  expect_error(check_prob(3))
  expect_error(check_prob(1.9))
})

test_that("check_trials works with valid number",{

  expect_true(check_trials(1))
  expect_true(check_trials(5))
  expect_length(check_trials(10),1)
})

test_that("check_trials with invalid number",{

  expect_error(check_trials(-1))
  expect_error(check_trials(0.1))
  expect_error(check_trials(-10))
})

test_that("check_success with valied number input",{

  expect_true(check_success(c(1,2,3),10))
  expect_true(check_success(0,5))
  expect_length(check_success(2,10),1)
})

test_that("check_success with invalid number input",{

  expect_error(check_success(c(-1,2,3),10))
  expect_error(check_success(c(0.1,1,3),6))
  expect_error(check_success(10,2))
  expect_error(check_success(c(10,1,2),3))
})
