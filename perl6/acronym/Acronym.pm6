unit module Acronym;

sub abbreviate ($phrase) is export {
    my @words   = $phrase.comb(/\w+/);
    my @letters = @words.map: { .comb.head.uc };

    return @letters.join;
}
