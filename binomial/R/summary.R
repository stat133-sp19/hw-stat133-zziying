# Description: compute the mean of the distribution
# Inputs
#   trials: number of trials (a numeric number)
#   prob: probability of success (a numeric number)
# Output
#   a numeric value, mean of the distribution
aux_mean <- function(trials,prob){
  return(trials * prob)
}

# Description: compute the variance of the distribution
# Inputs
#   trials: number of trials (a numeric number)
#   prob: probability of success (a numeric number)
# Output
#   a numeric value, variance of the distribution
aux_variance <- function(trials,prob){
  return(trials*prob*(1-prob))
}

# Description: compute the most likely number of success
# Inputs
#   trials: number of trials (a numeric number)
#   prob: probability of success (a numeric number)
# Output
#   a numeric value, mode of the distribution
aux_mode <- function(trials,prob){
  return(as.integer(trials*prob + prob))
}

# Description: measure the skewness of the binomial random variable
# Inputs
#   trials: number of trials (a numeric number)
#   prob: probability of success (a numeric number)
# Output
#   a numeric value, skewness of the distribution
aux_skewness <- function(trials,prob){
  return((1-2*prob)/ sqrt(trials*prob*(1-prob)))
}

# Description: meansure of the tailedness of the distribution of
# the random variable
# Inputs
#   trials: number of trials (a numeric number)
#   prob: probability of success (a numeric number)
# Output
#   a numeric value, measure tailedness of binomial distribution
aux_kurtosis <- function(trials,prob){
  return((1 - 6 * prob * (1-prob))/ (trials * prob * (1 - prob)))
}
