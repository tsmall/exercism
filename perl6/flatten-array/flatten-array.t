#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use FlattenArray;
plan 6;

my $c-data = from-json $=pod.pop.contents;
is-deeply flatten-array(.<input><array>), |.<expected description> for @($c-data<cases>);

=head2 Canonical Data
=begin code
{
  "exercise": "flatten-array",
  "version": "1.2.0",
  "cases": [
    {
      "description": "no nesting",
      "property": "flatten",
      "input": {
        "array": [0, 1, 2]
      },
      "expected": [0, 1, 2]
    },
    {
      "description": "flattens array with just integers present",
      "property": "flatten",
      "input": {
        "array": [1, [2, 3, 4, 5, 6, 7], 8]
      },
      "expected": [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
      "description": "5 level nesting",
      "property": "flatten",
      "input": {
        "array": [0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]
      },
      "expected": [0, 2, 2, 3, 8, 100, 4, 50, -2]
    },
    {
      "description": "6 level nesting",
      "property": "flatten",
      "input": {
        "array": [1, [2, [[3]], [4, [[5]]], 6, 7], 8]
      },
      "expected": [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
      "description": "6 level nest list with null values",
      "property": "flatten",
      "input": {
        "array": [0, 2, [[2, 3], 8, [[100]], null, [[null]]], -2]
      },
      "expected": [0, 2, 2, 3, 8, 100, -2]
    },
    {
      "description": "all values in nested list are null",
      "property": "flatten",
      "input": {
        "array": [null, [[[null]]], null, null, [[null, null], null], null]
      },
      "expected": []
    }
  ]
}
=end code
