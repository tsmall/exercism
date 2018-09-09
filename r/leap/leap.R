leap <- function(year) {
  if (year %divisible_by% 400) TRUE
  else if (year %divisible_by% 4) !(year %divisible_by% 100)
  else FALSE
}

`%divisible_by%` <- function(dividend, divisor) {
  dividend %% divisor == 0
}
