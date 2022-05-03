
# intendo

<!-- badges: start -->
[![R-CMD-check](https://github.com/pachadotdev/edmonton-rug-workshop/workflows/R-CMD-check/badge.svg)](https://github.com/pachadotdev/edmonton-rug-workshop/actions)
<!-- badges: end -->

The goal of intendo is to ...

## Installation

You can install the development version of intendo like so:

``` r
remotes::install_github("pachadotdev/edmonton-rug-workshop")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(intendo)
con <- sql_connection()
tbl(con, "sj_all_revenue_small") %>%
  filter(item_type == "iap" & item_name == "gold4")
```
