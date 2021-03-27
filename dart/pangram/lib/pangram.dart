class Pangram {
  static const _lettersInTheAlphabet = 26;

  final _seenLetters = <int>{};

  bool isPangram(String sentence) {
    _seenLetters.clear();
    for (int char in sentence.codeUnits) {
      _remember(char);
    }

    return _seenLetters.length == _lettersInTheAlphabet;
  }

  void _remember(int char) {
    final letter = _normalize(char);
    if (letter != -1) {
      _seenLetters.add(letter);
    }
  }

  int _normalize(int char) => char.isLetter ? char.toLower() : -1;
}

const _A = 65;
const _Z = 90;
const _a = 97;
const _z = 122;
const _caseDifference = 32;

extension CharHelpers on int {
  bool get isLetter => this.isUpperLetter || this.isLowerLetter;
  bool get isUpperLetter => this >= _A && this <= _Z;
  bool get isLowerLetter => this >= _a && this <= _z;

  int toLower() {
    if (this.isUpperLetter) {
      return this + _caseDifference;
    } else {
      return this;
    }
  }
}
