
Overview binomial package and Motivation
----------------------------------------

The package `"binomial"` is an R package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the exptected value, variance, etc. Moreover, the package also gives the summary of Binomial and visualizes the summary.

Usage
-----

``` r
library(binomial)

# bin_choose()
bin_choose(5, 4)
#> [1] 5


# bin_probability()
bin_probability(3, 5, 0.5)
#> [1] 0.3125


# bin_distribution() and its plotting
data1 <- bin_distribution(5, 0.5)  # the user can plot data1 by plot(data1)
data1
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125


# bin_cumulative() and its plotting 
data2 <- bin_cumulative(5, 0.5)
data2  # the user can plot data2 by plot(data2)
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000


# bin_variable() and its summary
bin1 <- bin_variable(trials = 10, prob = 0.3)
bin1 
#> "Binomial variable" 
#>  
#> Parameters 
#> - number of trials: 10 
#> - prob of success : 0.3

binsum1 <- summary(bin1)
binsum1
#> "Summary Binomial" 
#>  
#> Parameters 
#> - number of trials: 10 
#> - prob of success : 0.3 
#>  
#> Measures 
#> - mean    : 3 
#> - variance: 2.1 
#> - mode    : 3 
#> - skewness: 0.2760262 
#> - kurtosis: -0.1238095

# bin_mean()
bin_mean(10, 0.3)
#> [1] 3

# bin_variance()
bin_variable(10, 0.3)
#> "Binomial variable" 
#>  
#> Parameters 
#> - number of trials: 10 
#> - prob of success : 0.3

# bin_mode()
bin_mode(10, 0.3)
#> [1] 3

# bin_skewness()
bin_skewness(10, 0.3)
#> [1] 0.2760262

# bin_kurtosis()
bin_kurtosis(10, 0.3)
#> [1] -0.1238095
```
