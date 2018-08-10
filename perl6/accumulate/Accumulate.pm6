unit module Accumulate;

sub accumulate(@collection, $operation) is export {
    my @result = [];
    for @collection {
        @result.push: $operation($_);
    }
    return @result;
}
