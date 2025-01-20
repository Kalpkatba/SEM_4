import 'dart:io';
void Sim(double p, double r, double t) {
  double simint = (p * r * t) / 100;
  print('The Simple Interest is: $simint');
}

void main() {
  print("Enter Principle Amount");
  double p = double.parse(stdin.readLineSync()!);
  print("Enter Rate");
  double r = double.parse(stdin.readLineSync()!);
  print("Enter time period");
  double t = double.parse(stdin.readLineSync()!);

  Sim(p, r, t);
}
