square <- function(n) {
  stopifnot(n >= 1, n <= 64)
  if (n == 1) {
    1
  }
  else {
    square(n - 1) * 2
  }
}

total <- function() {
  squares <- 1:64
  grains_per_square <- sapply(squares, square)
  sum(grains_per_square)
}
