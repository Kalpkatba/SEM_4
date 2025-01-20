import 'dart:io';

void main(){
  print("Enter a number :");
  int? factor = int.parse(stdin.readLineSync()!);
  int fac=1;
  for(int i = 2 ; i <= factor ; i++){
    fac = fac*i;
  }
  print("Factorial of $factor is $fac");
}