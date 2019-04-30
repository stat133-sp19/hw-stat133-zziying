
Workout03: Binomial Package
---------------------------

The package `binomial` helps compute and generate the theoretical probability distribution with given numer of success and number of random trials.

-   `bin_distribution()` creates an object of class `bindis` with a data frame that shows the probability of each successes in a fixed number of trials

-   `bin_cumulative()` creates an object of class `bincum` with a data frame shows the cummulative probability of each success.

-   `bin_variable()` creates an object of class `binvar` lists the variables of the binomial distribution.

-   `plot()` method for a `bindis` object to plot the probability of success, and for a `bincum` object to plot the cumulative distribution.

-   `summary()` method for a `binvar` object to list the statistical elements of the binomial distribution.

#### Other helpful functions to calculate the statistical measures:

-   `bin_mean()` to calculate the mean.

-   `bin_variance()` to calculate the variance.

-   `bin_mode()` to calculate the most likely success number.

-   `bin_skewness()` to measure the skewenss.

-   `bin_kurtosis()` to calculate the kurtosis.

Usage
-----

``` r
library(binomial)

# create a binomial distribution
dist <- bin_distribution(trials = 5, prob = 0.5)
dist
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# create a cumulative distribution
cumdis <- bin_cumulative(trials = 5, prob = 0.5)
cumdis
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

# list the binomial variables 
var <- bin_variable(trials = 5, prob = 0.5)

# summary the binomial statistical elements:
summary(var)
#> "Summary Binomial"
#> 
#> Parameters
#> - number of trials:  5 
#> - prob of success :  0.5 
#> 
#> Measures
#> - mean    :  2.5 
#> - variance:  1.25 
#> - mode    :  3 
#> - skewness:  0 
#> - kurtosis:  -0.4
```

*For more information, please check out vignettes/Tutorial file*
