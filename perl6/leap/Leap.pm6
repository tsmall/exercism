unit module Leap;

sub is-leap-year (Int:D $year) returns Bool:D is export {
  return ($year %% 400) || (($year %% 4) && not ($year %% 100));
}
