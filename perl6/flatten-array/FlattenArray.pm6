unit module FlattenArray;

sub flatten-array (@input) is export {
  my @flattened;

  for @input -> $x {
    if $x ~~ List {
      @flattened.append: flatten-array($x);
    }
    else {
      @flattened.push($x) if $x.defined;
    }
  }

  return @flattened;
}
