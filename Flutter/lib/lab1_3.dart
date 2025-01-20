import 'dart:io';
void main(){
  print("Enter Fahrenheit");
  // ? is for allowing null value and ! is for not allowing null value
  int? f = int.parse(stdin.readLineSync()!);
  double c = (f-32)*(5/9);
  print(c);
}