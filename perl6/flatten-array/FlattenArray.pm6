unit module FlattenArray;

sub flatten-array (@input) is export {
  my @flattened;

  for @input -> $x {
    if $x ~~ List {
      @flattened.append: flatten-array($x);
    }
    elsif $x.defined {
      @flattened.push($x);
    }
  }

  return @flattened;
}
