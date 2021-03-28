class Leap {
  bool leapYear(int year) {
    if (year.isDivisibleBy(100)) {
      return year.isDivisibleBy(400);
    } else {
      return year.isDivisibleBy(4);
    }
  }
}

extension Division on int {
  bool isDivisibleBy(int divisor) {
    return this % divisor == 0;
  }
}
