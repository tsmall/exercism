// In this solution, I tried to avoid memory allocations. I got it down to 1-2
// string allocations per word found: one for the word itself, and another if
// the word happens to end with a quote.

const _A = 65;
const _Z = 90;
const _a = 97;
const _z = 122;
const _caseDifference = 32;
const _quote = 39;
const _zero = 48;
const _nine = 57;

class WordCount {
  Map<String, int> _counts = {};
  StringBuffer _word = StringBuffer();

  Map<String, int> countWords(String phrase) {
    _counts.clear();
    _word.clear();

    for (var charCode in phrase.codeUnits) {
      if (_isWordChar(charCode)) {
        _addChar(charCode);
      } else {
        _recordWord();
      }
    }
    _recordWord();

    return _counts;
  }

  bool _isWordChar(int charCode) {
    return (
      (charCode >= _A && charCode <= _Z) ||
      (charCode >= _a && charCode <= _z) ||
      (charCode >= _zero && charCode <= _nine) ||
      _isValidQuote(charCode)
    );
  }

  bool _isValidQuote(int charCode) {
    return !_word.isEmpty && charCode == _quote;
  }

  void _addChar(int charCode) {
    if (charCode >= _A && charCode <= _Z) {
      final lowerCaseChar = charCode + _caseDifference;
      _word.writeCharCode(lowerCaseChar);
    } else {
      _word.writeCharCode(charCode);
    }
  }

  void _recordWord() {
    final word = _removeTrailingQuote();

    if (word.isEmpty) {
      return;
    }

    _counts.update(word, _increment, ifAbsent: _one);
    _word.clear();
  }

  String _removeTrailingQuote() {
    final word = _word.toString();
    return word.endsWith("'") ? word.substring(0, word.length - 1) : word;
  }
}


int _increment(int n) { return n + 1; }
int _one() { return 1; }
