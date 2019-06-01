bool isValid(String isbn) {
  final verifier = new IsbnVerifier(isbn);
  return verifier.isValid;
}

class IsbnVerifier {
  String _code;

  IsbnVerifier(String isbn) {
    _code = _normalize(isbn);
  }

  String _normalize(String isbn) {
    return isbn.replaceAll("-", "");
  }

  bool get isValid {
    if (_code.length != 10) {
      return false;
    }

    try {
      return _computedValue % 11 == 0;
    } on FormatException {
      return false;
    }
  }

  int get _computedValue =>
    (_digit(1) * 10) +
    (_digit(2) * 9) +
    (_digit(3) * 8) +
    (_digit(4) * 7) +
    (_digit(5) * 6) +
    (_digit(6) * 5) +
    (_digit(7) * 4) +
    (_digit(8) * 3) +
    (_digit(9) * 2) +
    (_digit(10) * 1);

  int _digit(int index) {
    String char = _code[index - 1];
    if (index == 10 && char == "X") {
      char = "10";
    }
    return int.parse(char);
  }
}
