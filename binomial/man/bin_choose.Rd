% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_choose}
\alias{bin_choose}
\title{Choose combination}
\usage{
bin_choose(n, k)
}
\arguments{
\item{n}{number of trials}

\item{k}{a vector of number of success}
}
\value{
number of combinations of successes in n trials
}
\description{
calculates the number of combinations in which k successes
can occur in n trials
}
\examples{
# five combinations in which 2 successes can occur in 5 trials
bin_choose(n = 5, k = 2)
}
