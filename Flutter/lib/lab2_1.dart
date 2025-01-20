import 'dart:io';

void main(){
  print("Enter a number");
  int? p = int.parse(stdin.readLineSync()!);
  if(p>=0){
    print("Number is positive");
  }
  else{
    print("Number is negative");
  }
}