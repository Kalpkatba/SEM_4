import 'dart:io';

void fibonacci(int n) {
  int first = 0;
  int second = 1;

  stdout.write('$first, $second');
  for (int i = 2; i < n; i++) {
    int next = first + second;
    stdout.write(', $next');
    first = second;
    second = next;
  }
  stdout.writeln();
}

void main() {
  stdout.write("Enter the number of terms: ");
  int n = int.parse(stdin.readLineSync()!);
    fibonacci(n);
}
