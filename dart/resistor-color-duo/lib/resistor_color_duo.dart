import 'dart:math';

const _colorCodes = [
  'black', 'brown', 'red',    'orange', 'yellow',
  'green', 'blue',  'violet', 'grey',   'white',
];

class ResistorColorDuo {
  int value(List<String> colors) {
    assert(colors.length == 2);

    int value    = 0;
    int exponent = 1;
    int code;

    for (String color in colors) {
      code = _colorCodes.indexOf(color);
      value += pow(10, exponent) * code as int;
      exponent -= 1;
    }

    return value;
  }
}
