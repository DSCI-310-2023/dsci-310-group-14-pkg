
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NBASTARS

<!-- badges: start -->
<!-- badges: end -->

The goal of NBASTARS package is to assist with the machine learning task
of predicting NBA All stars using the NBA all stars data set from
kaggle.

## Installation

You can install the development version of NBASTARS from
[GitHub](https://github.com/DSCI-310/dsci-310-group-14-pkg) with:

``` r
# install.packages("devtools")
devtools::install_github("DSCI-310/dsci-310-group-14-pkg")
#> Skipping install of 'NBASTARS' from a github remote, the SHA1 (aa466ac5) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Examples

This is a basic example which shows you how to use the select_to_from
function which filters a specified variable using a range:

``` r
library(NBASTARS)
## basic example code
selected <- select_to_from(mtcars,mpg,21,22.8)
head(selected)
#>                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
#> Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
#> Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
```

This is a basic example which shows you how to use the proportion
function which summarizes the specified variable and returns a
percentage proportion:

``` r
## basic example code
proportion(mtcars,vs)
#> # A tibble: 2 × 3
#>      vs Counts Percent
#>   <dbl>  <int>   <dbl>
#> 1     0     18    56.2
#> 2     1     14    43.8
```

This is a basic example to use the split data function which splits the
dataset and saves it into two global variables “data_training” and
“data_testing”

``` r
## basic example code
split_data(mtcars,0.7,"vs")
head(data_testing)
#>                mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4 Wag 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710    22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
#> Merc 280C     17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> Merc 450SE    16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
#> Merc 450SL    17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
#> Fiat 128      32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
head(data_training)
#>                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
#> Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
#> Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
```

Here is a quick example of using the visualize_knn function which shows
us a elbow graph for K selection when using KNN prediction models:

``` r
K <- c(1,2,4,5,10,18,25)
accuracy <- c(0.2,0.4,0.6,0.7,0.4,0.2,0.3)
df <- data.frame(K,accuracy)
visualize_knn(df,K,accuracy,"example selector")
```

<img src="man/figures/README-k selector-1.png" width="100%" />
