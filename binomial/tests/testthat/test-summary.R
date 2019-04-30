context("Test for summary computation")

test_that("aux_mean works with normal input",{

  expect_equal(aux_mean(10,0.3),10*0.3)
  expect_equal(aux_mean(4,0.2),4*0.2)
  expect_length(aux_mean(4,0.2),1)
})

test_that("aux_mean fails with invalid input",{

  expect_error(aux_mean(10,0.3,2))
})

test_that("aux_variance works with normal input",{

  expect_equal(aux_variance(10,0.3), 10*0.3*0.7)
  expect_equal(aux_variance(20,0.2), 20*0.2*0.8)
  expect_length(aux_variance(20,0.2),1)
})

test_that("aux_variance fails with invalid input",{

  expect_error(aux_variance(10,0.2,3))
})

test_that("aux_mode() works with normal input", {

  expect_equal(aux_mode(40,0.8),as.integer(40 * 0.8 + 0.8))
  expect_equal(aux_mode(50,0.3),as.integer(50*0.3 + 0.3))
  expect_length(aux_mode(40,0.3),1)
})

test_that("aux_mode fails with invalid input",{

  expect_error(aux_mode(40,0.2,1))
})

test_that("aux_skewness works with ok input",{
  x <- c(10,0.3)
  z <- (1-2*x[2])/ sqrt(x[1]*x[2]*(1-x[2]))

  expect_equal(aux_skewness(10,0.3), z)
  expect_length(aux_skewness(10,0.3),1)
})

test_that("aux_skewess fails with invalid input",{

  expect_error(aux_skewness(10,0.3,1))
})

test_that("aux_kurtosis works with ok input",{
  x <- c(10,0.3)
  z <- (1 - 6 * x[2] * (1-x[2]))/ (x[1] * x[2] * (1 - x[2]))

  expect_equal(aux_kurtosis(10,0.3), z)
  expect_length(aux_kurtosis(10,0.3),1)
})

test_that("aux_kurtosis fails with invalid input",{

  expect_error(aux_kurtosis(10,0.3,5))
})
