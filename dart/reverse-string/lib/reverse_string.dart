String reverse(String original) {
  final reversed = StringBuffer();

  final chars = original.codeUnits;
  for (var i = chars.length - 1; i >= 0; i--) {
    reversed.writeCharCode(chars[i]);
  }

  return reversed.toString();
}
