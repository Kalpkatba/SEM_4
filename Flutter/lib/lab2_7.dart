void main() {
  String s = "   fly me   to   the moon  ";
  int length = 0;
  bool charFound = false;

  for (int i = s.length - 1; i >= 0; i--) {
    if (s[i] != ' ') {
      charFound = true;
      length++;
    } else if
    (charFound) {
      break;
    }
  }


  print("Length of the last word: $length");
}
