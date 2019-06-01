final _aRune = 'a'.runes.first;

class Isogram {

  bool isIsogram(String word) {
    final haveSeenLetter = new List<bool>.filled(26, false);

    int index;
    for (int rune in word.toLowerCase().runes) {
      index = rune - _aRune;
      if (index < 0 || index > 25) {
        continue;
      }

      if (haveSeenLetter[index]) {
        return false;
      }

      haveSeenLetter[index] = true;
    }

    return true;
  }

}
