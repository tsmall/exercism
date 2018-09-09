difference_of_squares <- function(natural_number) {
  nums <- 0:natural_number
  square(sum(nums)) - sum(square(nums))
}

square <- function(n) {
  n * n
}
