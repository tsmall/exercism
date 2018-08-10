unit module Grains;

sub grains-on-square (Int:D $square) returns Int:D is export {
    unless is-valid-square-number($square) {
        die "Invalid square: $square";
    }

    my $grains = 1;
    for 2..$square {
        $grains *= 2;
    }

    return $grains;
}

sub is-valid-square-number (Int:D $n) {
    return $n > 0 && $n <= 64;
}

sub total-grains is export {
    return [+] (1..64)>>.&grains-on-square;
}
