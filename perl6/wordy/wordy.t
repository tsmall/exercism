#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use Wordy;
plan 16;

my $c-data = from-json $=pod.pop.contents;
for @($c-data<cases>) {
  if .<expected> === False {
    throws-like {.<input><question>.&answer}, Exception, .<description>;
  } else {
    is .<input><question>.&answer, |.<expected description>;
  }
}

=head2 Canonical Data
=begin code
{
  "exercise": "wordy",
  "version": "1.1.0",
  "comments": [
    "The tests that expect 'false' should be implemented to raise",
    "an error, or indicate a failure. Implement this in a way that",
    "makes sense for your language."
  ],
  "cases": [
    {
      "description": "addition",
      "property": "answer",
      "input": {
        "question": "What is 1 plus 1?"
      },
      "expected": 2
    },
    {
      "description": "more addition",
      "property": "answer",
      "input": {
        "question": "What is 53 plus 2?"
      },
      "expected": 55
    },
    {
      "description": "addition with negative numbers",
      "property": "answer",
      "input": {
        "question": "What is -1 plus -10?"
      },
      "expected": -11
    },
    {
      "description": "large addition",
      "property": "answer",
      "input": {
        "question": "What is 123 plus 45678?"
      },
      "expected": 45801
    },
    {
      "description": "subtraction",
      "property": "answer",
      "input": {
        "question": "What is 4 minus -12?"
      },
      "expected": 16
    },
    {
      "description": "multiplication",
      "property": "answer",
      "input": {
        "question": "What is -3 multiplied by 25?"
      },
      "expected": -75
    },
    {
      "description": "division",
      "property": "answer",
      "input": {
        "question": "What is 33 divided by -3?"
      },
      "expected": -11
    },
    {
      "description": "multiple additions",
      "property": "answer",
      "input": {
        "question": "What is 1 plus 1 plus 1?"
      },
      "expected": 3
    },
    {
      "description": "addition and subtraction",
      "property": "answer",
      "input": {
        "question": "What is 1 plus 5 minus -2?"
      },
      "expected": 8
    },
    {
      "description": "multiple subtraction",
      "property": "answer",
      "input": {
        "question": "What is 20 minus 4 minus 13?"
      },
      "expected": 3
    },
    {
      "description": "subtraction then addition",
      "property": "answer",
      "input": {
        "question": "What is 17 minus 6 plus 3?"
      },
      "expected": 14
    },
    {
      "description": "multiple multiplication",
      "property": "answer",
      "input": {
        "question": "What is 2 multiplied by -2 multiplied by 3?"
      },
      "expected": -12
    },
    {
      "description": "addition and multiplication",
      "property": "answer",
      "input": {
        "question": "What is -3 plus 7 multiplied by -2?"
      },
      "expected": -8
    },
    {
      "description": "multiple division",
      "property": "answer",
      "input": {
        "question": "What is -12 divided by 2 divided by -3?"
      },
      "expected": 2
    },
    {
      "description": "unknown operation",
      "property": "answer",
      "input": {
        "question": "What is 52 cubed?"
      },
      "expected": false
    },
    {
      "description": "Non math question",
      "property": "answer",
      "input": {
        "question": "Who is the President of the United States?"
      },
      "expected": false
    }
  ]
}
=end code
