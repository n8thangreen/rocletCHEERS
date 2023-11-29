# rocletCHEERS

[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)

Automatically create a report using the CHEERS [checklist](https://www.ispor.org/heor-resources/good-practices/cheers) from R code using `roxygen2`.

## Overview

Simply insert roxygen style comments into the code using the tag `@cheers`.
For example, this will look like this

```r
#' My function name
#'
#' @cheers population-adjustment
#' @cheers uncertainty
#' @export
#'
dd <- function(x, y) {
  #' @cheers input-distributions
  x <- 1
  #' @cheers input-parameters
  y <- 2
  #' @cheers mean-outputs
  # ...
}
```

Note that the comments

* have to be as part of a function
* can be in the function documentation block at the top or in the function body

## Full list of fields


* `comparators`
* `time-horizon`
* `discount-rate`
* `outcomes`
* `costs`
* `currency`?
* `extrapolation`
* `population-adjustment`
* `uncertainty`
* `input-distributions`
* `input-parameters`
* `mean-outputs`

## Example

### Usage
After inserting the comments in the code then simply _roxygenise_ just like you would normally when creating package documentation but using the `cheers_roclet` roclet instead.

```r
roxygenize(roclets = "cheers_roclet")
```

### Output

```r
time-horizon: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:6] time-horizon
population-adjustment: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:23] population-adjustment
sensitivity analysis: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:4] sensitivity analysis
comparators: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:5] comparators
discount-rate: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:7] discount-rate
outcomes: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:8] outcomes
costs: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:9] costs
extrapolation: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:10] extrapolation
uncertainty: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:24] uncertainty
input-distributions: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:25] input-distributions
input-parameters: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:26] input-parameters
mean-outputs: 
 * [C:\Users\n8tha\Documents\R\rocletCHEERS\R\dummy-functions-2.R:27] mean-outputs
 ```
 
