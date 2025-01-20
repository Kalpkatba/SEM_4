import 'dart:io';

void main(){
  print("Enter 1 for addition,2 for substraction,3 for multiplication,4 for division");
  int? a = int.parse(stdin.readLineSync()!);
  print("Enter Number 1 : ");
  int? b = int.parse(stdin.readLineSync()!);
  print("Enter Number 2 : ");
int? c = int.parse(stdin.readLineSync()!);
  switch(a) {
    case 1:
      print('Addition of $b and $c is : ${b + c}');
    case 2:
      print('Addition of $b and $c is : ${b - c}');
    case 3:
      print('Multiplication of $b and $c is : ${b * c}');
    case 4:
      print('Division of $b and $c is : ${b / c}');
  }
}