unit module Wordy;

grammar WordProblem {
  rule TOP { 'What is' <first-num> <calc-op>+ '?' }

  token first-num { <num> }

  proto rule calc-op          {*}
        rule calc-op:sym<add> { 'plus' <num> }
        rule calc-op:sym<sub> { 'minus' <num> }
        rule calc-op:sym<mul> { 'multiplied by' <num> }
        rule calc-op:sym<div> { 'divided by' <num> }

  token num { '-'? \d+ }
}

class WordProblemSolver {
  has $.state;

  method first-num        ($/) { $!state = $<num>; }
  method calc-op:sym<add> ($/) { $!state += $<num>; }
  method calc-op:sym<sub> ($/) { $!state -= $<num>; }
  method calc-op:sym<mul> ($/) { $!state *= $<num>; }
  method calc-op:sym<div> ($/) { $!state /= $<num>; }
}

sub answer ($question) is export {
  my $solver = WordProblemSolver.new;
  if WordProblem.parse($question, actions => $solver) ~~ Nil {
    die "I don't know how to answer that question.";
  }
  return $solver.state;
}
