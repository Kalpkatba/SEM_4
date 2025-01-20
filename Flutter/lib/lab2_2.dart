import 'dart:io';

void main(){
  print("Enter 1 for addition,2 for substraction,3 for division and 4 for multiplication");
  int? i = int.parse(stdin.readLineSync()!);
  print("Enter value of a");
  double? a = double.parse(stdin.readLineSync()!);
  print("Enter value of b");
  double? b = double.parse(stdin.readLineSync()!);
  if(i==1){
    double add = a+b;
    print(add);
  }
  else if(i==2){
    double sub = a-b;
    print(sub);
  }
  else if(i==3 && b!=0){
    double div = a/b;
    print(div);
  }
  else if(i==4){
    double mul = a*b;
    print(mul);
  }
}