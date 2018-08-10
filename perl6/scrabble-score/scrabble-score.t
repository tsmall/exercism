#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use Scrabble;
plan 11;

my $c-data = from-json $=pod.pop.contents;
is .<input><word>.&score, |.<expected description> for @($c-data<cases>);

=head2 Canonical Data
=begin code
{
  "exercise": "scrabble-score",
  "version": "1.1.0",
  "cases": [
    {
      "description": "lowercase letter",
      "property": "score",
      "input": {
        "word": "a"
      },
      "expected": 1
    },
    {
      "description": "uppercase letter",
      "property": "score",
      "input": {
        "word": "A"
      },
      "expected": 1
    },
    {
      "description": "valuable letter",
      "property": "score",
      "input": {
        "word": "f"
      },
      "expected": 4
    },
    {
      "description": "short word",
      "property": "score",
      "input": {
        "word": "at"
      },
      "expected": 2
    },
    {
      "description": "short, valuable word",
      "property": "score",
      "input": {
        "word": "zoo"
      },
      "expected": 12
    },
    {
      "description": "medium word",
      "property": "score",
      "input": {
        "word": "street"
      },
      "expected": 6
    },
    {
      "description": "medium, valuable word",
      "property": "score",
      "input": {
        "word": "quirky"
      },
      "expected": 22
    },
    {
      "description": "long, mixed-case word",
      "property": "score",
      "input": {
        "word": "OxyphenButazone"
      },
      "expected": 41
    },
    {
      "description": "english-like word",
      "property": "score",
      "input": {
        "word": "pinata"
      },
      "expected": 8
    },
    {
      "description": "empty input",
      "property": "score",
      "input": {
        "word": ""
      },
      "expected": 0
    },
    {
      "description": "entire alphabet available",
      "property": "score",
      "input": {
        "word": "abcdefghijklmnopqrstuvwxyz"
      },
      "expected": 87
    }
  ]
}
=end code
