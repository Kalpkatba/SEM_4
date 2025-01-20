import 'dart:io';

void main(){
  print("Enter weight in pound");
  double? p = double.parse(stdin.readLineSync()!);
  double w = p*(0.45359237);
  print("Enter height in inches");
  double? i = double.parse(stdin.readLineSync()!);
  double h = i*(0.254);
  print(h);
  double bmi = w/(h*h);

  print("BMI is :$bmi");
}