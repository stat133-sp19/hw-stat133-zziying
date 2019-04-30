# Description: private function to check vector of probability
# Inputs
#   prob: probability (a numberic value)
# Output
#   TURE (a logical value)
#   Or an error message
check_prob <- function(prob){
  if(prob > 1 | prob < 0){
    stop("invalid prob value")
  }
  TRUE
}

# Description: check if the number of trials valid
# Inputs
#   trials: number of trials (a numberic value)
# Output
#   TURE (a logical value)
#   Or an error message
check_trials <- function(trials){
  if(!trials%%1 == 0 | trials < 0){
    stop("invalid trials value")
  }
  TRUE
}
# Description: check if the number of success is valid
# Input
#   trials: number of trials (a numeric value)
#   success: number of success (a numeric vector)
# Output
#   Locial value(TRUE)
#   OR an error message
check_success <- function(success,trials){
  if(any(!success%%1 == 0)| any(success < 0)){
    stop("invalid success value")
  }
  if(any(success > trials)){
    stop("success cannot be greater than trials")
  }
  TRUE
}
