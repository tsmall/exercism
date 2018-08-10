unit module Scrabble;

my %score-for := :{
    (any <a e i o u>) => 1,
    (any <l n r s t>) => 1,
    (any <d g>)       => 2,
    (any <b c m p>)   => 3,
    (any <f h v w y>) => 4,
    (any <k>)         => 5,
    (any <j x>)       => 8,
    (any <q z>)       => 10,
};

sub score (Str:D $word) returns Int:D is export {
    my @letters = $word.comb;
    my @scores  = @letters.map: { %score-for{ $_.lc } };

    return [+] @scores;
}
