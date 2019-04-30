context("Test for object of binomial")

test_that("bin_choose works with ok input",{
  x <- factorial(5)/(factorial(2)*factorial(5-2))

  expect_equal(bin_choose(5,2),x)
})

test_that("bin_choose does not work with invalid input",{
  expect_error(bin_choose(2,5))
  expect_error(bin_choose(-2,5))
  expect_error(bin_choose(5,-2))
})

test_that("bin_probability works with ok input",{
  x <- bin_choose(5,2) * (0.5)^2 * (1-0.5)^(5-2)

  expect_equal(bin_probability(2,5,0.5),x)
})

test_that("bin_probability does not work with invalid input",{

  expect_error(bin_probability(5,2,0.5))
  expect_error(bin_probability(-5,2,0.5))
  expect_error(bin_probability(5,-2,0.5))
  expect_error(bin_probability(5,2,2))
  expect_error(bin_probability(0.1,2,0.1))
})

test_that("bin_distribution works with valid input",{

  expect_is(bin_distribution(10,0.3),"data.frame")
  expect_is(bin_distribution(10,0.3),"bindis")
})

test_that("bin_distribution fails with invalid input",{

  expect_error(bin_distribution(0.3,0.3))
  expect_error(bin_distribution(10,-1))
  expect_error(bin_distribution(10,2))
  expect_error(bin_distribution(-1,0.3))
})

test_that("bin_cumulative works with valid input",{

  expect_is(bin_cumulative(10,0.3),"bincum")
  expect_is(bin_cumulative(10,0.3),"data.frame")
})

test_that("bin_cumulative fails with invalid input",{

  expect_error(bin_cumulative(10,-1))
  expect_error(bin_cumulative(-10,0.1))
  expect_error(bin_cumulative(0.1,0.1))
})

test_that("bin_variable works with ok input",{

  expect_is(bin_variable(10,0.3), "binvar")
})

test_that("bin_variable fails with invalid input",{

  expect_error(bin_variable(10,-1))
  expect_error(bin_variable(0.2,1))
  expect_error(bin_varibale(10,1))
  expect_error(bin_variable(0.1,0.1))
})

test_that("summary.binvar works with ok input",{
  x <- bin_variable(10,0.3)

  expect_is(summary.binvar(x), "summary.binvar")
})

test_that("bin_mean works with ok input",{
  x <- c(10,0.3)
  z <- x[1] * x[2]

  expect_equal(bin_mean(10,0.3),z)
})

test_that("bin_mean fails with invalid input",{
  expect_error(bin_mean(0.3,10))
  expect_error(bin_mean(-1,0.3))
  expect_error(bin_mean(10,4))
  expect_error(bin_mean(10,-1))
})

test_that("bin_variance works with ok input",{
  x <- c(10,0.3)
  z <- x[1] * x[2]*(1-x[2])

  expect_equal(bin_variance(10,0.3), z)
})

test_that("bin_variance fails with invalid input",{
  expect_error(bin_variance(0.3,10))
  expect_error(bin_variance(-1,0.3))
  expect_error(bin_variance(10,4))
  expect_error(bin_variance(10,-1))
})

test_that("bin_mode works with valid input",{
  x <- c(40,0.8)
  z <- as.integer(x[1]*x[2] + x[2])

  expect_equal(bin_mode(40,0.8),z)
})

test_that("bin_mode fails with invalid input",{
  expect_error(bin_mode(0.3,10))
  expect_error(bin_mode(-1,0.3))
  expect_error(bin_mode(10,4))
  expect_error(bin_mode(10,-1))
})

test_that("bin_skewness works with ok input",{
  x <- c(10,0.3)
  z <- (1-2*x[2])/ sqrt(x[1]*x[2]*(1-x[2]))

  expect_equal(bin_skewness(10,0.3), z)
})

test_that("bin_skewness fails with invalid input",{
  expect_error(bin_skewness(0.3,10))
  expect_error(bin_skewness(-1,0.3))
  expect_error(bin_skewness(10,4))
  expect_error(bin_skewness(10,-1))
})

test_that("bin_kurtosis works with ok input",{
  x <- c(10,0.3)
  z <- (1 - 6 * x[2] * (1-x[2]))/ (x[1] * x[2] * (1 - x[2]))

  expect_equal(bin_kurtosis(10,0.3), z)
})

test_that("bin_kurtosis fails with invalid input",{
  expect_error(bin_kurtosis(0.3,10))
  expect_error(bin_kurtosis(-1,0.3))
  expect_error(bin_kurtosis(10,4))
  expect_error(bin_kurtosis(10,-1))
})
