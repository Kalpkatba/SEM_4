import 'dart:io';

void main(){
  //meter to feet
  print("Enter value in meter");
  double? m = double.parse(stdin.readLineSync()!);
  double a = (3.28084)*m;
  print(a);
}