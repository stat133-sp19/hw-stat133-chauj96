# 1.1) Private Checker Functions

##### Function check_prob()
check_prob <- function(prob = 0) {
  if (prob < 0 || prob > 1) {
    stop("p hast to be a number between 0 and 1")
  }
  return(TRUE)
}

##### Function check_trials()
check_trials <- function(trials = 0) {
  if (trials != round(trials) || trials < 0){
    stop("invalid trials value")
  }
  return(TRUE)
}

##### Function check_success()
check_success <- function(success, trials) {
  for (i in success) {
    if (i > trials || i < 0) {
      stop("invalid success value")
    }
  }
  return(TRUE)
}



# 1.2) Private Auxiliary Functions

##### Mean Function
aux_mean <- function(trials, prob) {
  mean <- trials * prob
  return(mean)
}

##### Variance Function
aux_variance <- function(trials, prob) {
  variance <- trials * prob * (1 - prob)
  return(variance)
}

##### Mode Function
aux_mode <- function(trials, prob) {
  mode <- floor(trials * prob + prob)
  return(mode)
}

##### Skewness Function
aux_skewness <- function(trials, prob) {
  skewness <- (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
  return(skewness)
}

##### Kurtosis Function
aux_kurtosis <- function(trials, prob) {
  kurtosis <- (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
  return(kurtosis)
}



# 1.3) Function bin_choose()

#' @title bin_choose()
#' @description calculate the number of combinations in which k successes in n trials
#' @param success number of successes
#' @param trials number of trials
#' @return the number of combinations
#' @export

bin_choose <- function(trials, success) {
  if (success > trials) {
    stop("successes cannot be greater than trials")
  }
  choose <- factorial(trials) / (factorial(success) * factorial(trials - success))
  return(choose)
}



# 1.4) Function bin_probability()

#' @title bin_probability()
#' @description calcuate the binomial probability
#' @param success the number of success
#' @param trials the number of trials
#' @param prob the probability
#' @return the binomial probability
#' @export

bin_probability <- function(success, trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  else if (check_prob(prob) == FALSE) {
    stop("invalid probability value")
  }
  else if (check_success(success, trials) == FALSE) {
    stop("invalid success value")
  }
  else {
    probability <- bin_choose(trials, success)*(prob^success)*(1-prob)^(trials - success)
    return(probability)
  }
}



# 1.5) Function bin_distribution()

#' @title bin_distribution()
#' @description calcuate the binomial distribution
#' @param trials the number of trials
#' @param prob the probability
#' @return a data frame with successes and corresponding probabilities
#' @export

bin_distribution <- function(trials, prob) {
  df <- c()
  success <- (0:trials)
  for (i in success) {
    distrib <- bin_probability(i, trials, prob)
    df <- c(df, distrib)
  }

  df2 <- data.frame(success, "probability" = df)
  class(df2) <- c("bindis", "data.frame")
  return(df2)
}

##### Function plot.bindis()

#' @export
plot.bindis <- function(x) {
  barplot(x$probability, names.arg = x$success, ylab = "probability", xlab = "success")
}



# 1.6) Function bin_cumulative()

#' @title bin_cumulative()
#' @description calcuate the binomial cumulative distribution
#' @param trials the number of trials
#' @param prob the probability
#' @return a data frame with successes and probability and cumulative
#' @export

bin_cumulative <- function(trials, prob) {
  cum_df <- c()
  success <- (0:trials)
  for (i in success) {
    distrib2 <- bin_probability(i, trials, prob)
    cum_df <- c(cum_df, distrib2)
  }
  cum_prob <- c()
  prob <- 0
  for (i in 1:length(cum_df)) {
    prob <- prob + cum_df[i]
    cum_prob <- append(cum_prob, prob)
  }

  cum_df2 <- data.frame(success, "probability" = cum_df, "cumulative" = cum_prob)
  class(cum_df2) <- c("bincum", "data.frame")
  return(cum_df2)
}

##### Function plot.bincum()

#' @export
plot.bincum <- function(k) {
  plot(k$success, k$cumulative, ylab = "probability", xlab = "success")
  lines(k$success, k$cumulative, type = "o")
  }



# 1.7) Function bin_variable()

#' @title bin_variable()
#' @description compute the binomial random variable
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial random variable object and a list with named elements
#' @export

bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  ls <- list(trials, prob)
  names(ls) <- c("trials", "prob")
  class(ls) <- "binvar"
  return(ls)
}

##### Method print.binvar()
#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"', "\n","\n")

  cat("Parameters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob)
}


##### Methods summary.binvar() and print.summary.binvar()
#' @export
summary.binvar <- function(x) {
  mean <- aux_mean(x$trials, x$prob)
  variance <- aux_variance(x$trials, x$prob)
  mode <- aux_mode(x$trials, x$prob)
  skewness <- aux_skewness(x$trials, x$prob)
  kurtosis <- aux_kurtosis(x$trials, x$prob)
  vec <- list(x$trials, x$prob, mean, variance, mode, skewness, kurtosis)
  names(vec) <- c("trials", "prob", "mean", "variance", "mode", "skewness", "kurtosis")
  class(vec) <- "summary.binvar"
  return(vec)
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"', "\n","\n")

  cat("Parameters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n","\n")

  cat("Measures", "\n")
  cat("- mean    :", summary.binvar(x)$mean, "\n")
  cat("- variance:", summary.binvar(x)$variance, "\n")
  cat("- mode    :", summary.binvar(x)$mode, "\n")
  cat("- skewness:", summary.binvar(x)$skewness, "\n")
  cat("- kurtosis:", summary.binvar(x)$kurtosis, "\n")

}



# 1.8) Functions of measures

##### bin_mean
#' @title bin_mean function
#' @description compute the auxiliary mean
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial mean
#' @export

bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binMean <- aux_mean(trials, prob)
  return(binMean)
}


##### bin_variance
#' @title bin_variance
#' @description compute the auxiliary variance
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial variance
#' @export

bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binVar <- aux_variance(trials, prob)
  return(binVar)
}


##### bin_mode
#' @title bin_mode
#' @description compute the auxiliary mode
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial auxiliary mode
#' @export

bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binMode <- aux_mode(trials, prob)
  return(binMode)
}


##### bin_skewness
#' @title bin_skewness
#' @description compute the binomial auxiliary skewness
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial auxiliary skewness
#' @export

bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binSkew <- aux_skewness(trials, prob)
  return(binSkew)
}


##### bin_kurtosis
#' @title bin_kurtosis
#' @description compute the binomial auxiliary kurtosis
#' @param trials the number of trials
#' @param prob the probability
#' @return a binomial auxiliary kurtosis
#' @export

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binKurt <- aux_kurtosis(trials, prob)
  return(binKurt)
}

