
# totalsummaryfunction

The goal of *totalsummaryfunction* is to allow you to use and understand
the function *total_summary*. This will allow you to quickly and easily
visualize all the summary stats you might like to know about a given
variable in a dataframe. You can choose to group this summary variable
by one or more grouping variables, if you would like, or leave out the
grouping entirely.

To be specific, the summary statistics output by *total_summary* are the
mean, range, minimum, 1st quartile, median, 3rd quartile, and maximum.

## Installation

You can install the development version of *totalsummaryfunction* from
[GitHub](https://github.com/) with:

``` r
# install_github("stat545ubc-2024/totalsummaryfunction", ref = "0.1.0")
```

From there, it is the simple matter of loading the package with the
*library* function, and you’re good to go.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(totalsummaryfunction)

# dataframe for example

data <- data.frame(
  colour = rep(c("Red", "Blue", "Yellow"), each = 5),
  number = rnorm(15))

# quick example

total_summary(data, colour, summ_var = number)
#> # A tibble: 3 × 8
#>   colour    mean range     min first_quartile  median third_quartile   max
#>   <chr>    <dbl> <dbl>   <dbl>          <dbl>   <dbl>          <dbl> <dbl>
#> 1 Blue    0.0644  2.44 -0.987          -0.341 -0.0266         0.225  1.45 
#> 2 Red     1.13    2.19  0.0356          0.658  1.23           1.50   2.23 
#> 3 Yellow -0.509   2.09 -1.36           -1.31  -0.668          0.0569 0.732
```
