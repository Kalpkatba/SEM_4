import 'dart:io';

void main() {
  print("Enter 1st number");
  int? a = int.parse(stdin.readLineSync()!);
  print("Enter 2st number");
  int? b = int.parse(stdin.readLineSync()!);
  print("Enter 3st number");
  int? c = int.parse(stdin.readLineSync()!);
  (a > b) ? ((a > c) ? print("$a is largest") : print("$c is largest") ): ((b>c)? print("$b is largest"):print("$c is largest"));
}