import 'dart:io';

void main(){
  print("Enter Marks of 1st subject");
  int? a = int.parse(stdin.readLineSync()!);
  print("Enter Marks of 2st subject");
  int? b = int.parse(stdin.readLineSync()!);
  print("Enter Marks of 3st subject");
  int? c = int.parse(stdin.readLineSync()!);
  print("Enter Marks of 4st subject");
  int? d = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Marks of 5st subject");
  int? e = int.parse(stdin.readLineSync()!);

  double per = ((a+b+c+d+e)/500)*100;
  print(per);
}