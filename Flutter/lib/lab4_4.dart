import 'dart:io';

int check(int n) {
  if (n <= 1) return 0;

  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return 0;
  }
  return 1;
}

void main() {
  stdout.write("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);

  int result = check(n);
  print(result);

}



