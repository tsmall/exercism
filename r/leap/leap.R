leap <- function(year) {
  if (year %divisible_by% 400) {
    return(TRUE)
  }
  if (year %divisible_by% 4) {
    return(! year %divisible_by% 100)
  }
  return(FALSE)
}

`%divisible_by%` <- function(dividend, divisor) {
  dividend %% divisor == 0
}
