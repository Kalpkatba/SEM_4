import 'dart:io';

void main() {
  print("Enter a number to find its factors:");
  int? num = int.parse(stdin.readLineSync()!);

  print("Factors of $num are:");
  for (int i = 2; i <= num; i++) {
    if (num % i == 0) {
      stdout.write(i);
    }
  }
}
