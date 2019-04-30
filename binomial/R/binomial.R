#' @title Choose combination
#' @description calculates the number of combinations in which k successes
#' can occur in n trials
#' @param n number of trials
#' @param k a vector of number of success
#' @return number of combinations of successes in n trials
#' @export
#' @examples
#' # five combinations in which 2 successes can occur in 5 trials
#' bin_choose(n = 5, k = 2)
bin_choose <- function(n,k){
  if(any(!k%%1 == 0)| any(k < 0)){
    stop("invalid success value")
  }
  if(any(k > n)){
    stop("success number k cannot be greater than trials n")
  }
  return(factorial(n)/(factorial(k)*factorial(n-k)))
}

#' @title Binomial Probability
#' @description calculate the probability of success
#' @param success vector of number of success
#' @param trials number of trials
#' @param prob the probability if success
#' @return a vector of probability of success with given success in trials
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials and assume the probability
#' # of success is 0.5
#' bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability <- function(success,trials,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  prob <- bin_choose(trials,success) * (prob)^success * (1-prob)^(trials - success)
  return(prob)
}

#' @title Binomial Distribution
#' @description compute the probability distribution
#' @param trials number of trials
#' @param prob the probability if success
#' @return an object of class \code{"bindis"}
#' @return an object of class \code{"data.frame"}
#' @export
#' @examples
#' # binomial probability distribution of different success in five trials
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob){
  probability <- bin_probability(0:(trials),trials,prob)
  obj <- data.frame(
    success = 0:trials,
    probability = probability
  )
  class(obj) <- c("bindis","data.frame")
  return(obj)
}

#' @export
plot.bindis <- function(x, ...){
  barplot(x$probability, names.arg = x$success,
          xlab = "Success", ylab = "Probability", border = "white")
}

#' @title Binomial cumulative distribution
#' @description compute the probability distribution and
#' the cumulative distribution
#' @param trials number of trials
#' @param prob the probability if success
#' @return an object of class \code{"bincum"}
#' @return an object of class \code{"data.frame"}
#' @export
#' @examples
#' # binomial cumulative distribution of different success in five trials
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob){
  probability <- bin_probability(0:(trials),trials,prob)
  cumulative <- NULL
  for(i in 1:(trials+1)){
    cumulative[i] <- sum(probability[1:i])
  }
  obj <- data.frame(
    success = 0:trials,
    probability = probability,
    cumulative = cumulative
  )
  class(obj) <- c("bincum","data.frame")
  return(obj)
}

#' @export
plot.bincum <- function(x, ...){
  plot(x$success, x$cumulative, xlab = "Success", ylab = "Cumulative")
  lines(x$success,x$cumulative)
}

#' @title Binomial variable
#' @description compute the binomial random variable
#' @param trials number of trials
#' @param prob the probability if success
#' @return an object of class \code{"binvar"} with the following elements:
#' @return \item{trials}{number of trials}
#' @return \item{prob}{probability of success}
#' @export
#' @examples
#' # binomial random variable with parameters 10 trials and 0.3 probability
#' bin_variable(trials = 10, prob = 0.3)
bin_variable <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  obj <- list(
    trials = trials,
    prob = prob
  )
  class(obj) <- "binvar"
  return(obj)
}

#' @export
print.binvar <- function(x,...){
  cat("Binomial variable\n\n")
  cat("Parameters\n")
  cat("- number of trials: ", x$trials[1:length(x$trials)], "\n")
  cat("- prob of success: ", x$prob[1:length(x$prob)])
  invisible(x)
}

#' @export
summary.binvar <- function(object,...){
  trials <- object$trials
  prob <- object$prob
  obj <- list(
    trials = trials,
    prob = prob,
    mean = aux_mean(trials,prob),
    variance = aux_variance(trials,prob),
    mode = aux_mode(trials, prob),
    skewness = aux_skewness(trials,prob),
    kurtosis = aux_kurtosis(trials,prob)
  )
  class(obj) <- "summary.binvar"
  obj
}

#' @export
print.summary.binvar <- function(x,...){
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials: ", x$trials, "\n")
  cat("- prob of success : ", x$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    : ", x$mean, "\n")
  cat("- variance: ", x$variance, "\n")
  cat("- mode    : ", x$mode, "\n")
  cat("- skewness: ", x$skewness, "\n")
  cat("- kurtosis: ", x$kurtosis, "\n")
  invisible(x)
}

#' @title Binomial mean
#' @description Compute the binomial distribution mean
#' @param trials numeric number of trials
#' @param prob numeric number of probability
#' @export
#' @examples
#' bin_mean(10,0.3)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial variance
#' @description Compute the binomial distribution variance
#' @param trials numeric number of trials
#' @param prob numeric number of probability
#' @export
#' @examples
#' bin_variance(10,0.3)
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial mode
#' @description compute the most likely number of success
#' @param trials numeric number of trials
#' @param prob numeric number of probability
#' @export
#' @examples
#' bin_mode(10,0.3)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}

#' @title Binomial Skewness
#' @description measure the skewness of the binomial random variable
#' @param trials numeric number of trials
#' @param prob numeric number of probability
#' @export
#' @examples
#' bin_skewness(10,0.3)
bin_skewness <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials,prob))
}

#' @title Binomial Skewness
#' @description meansure of the tailedness of the distribution of
#' @param trials numeric number of trials
#' @param prob numeric number of probability
#' @export
#' @examples
#' bin_kurtosis(10,0.3)
bin_kurtosis <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}
