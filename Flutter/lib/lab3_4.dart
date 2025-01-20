import 'dart:io';

void main(){
  print("Enter numbers :");
  int num = int.parse(stdin.readLineSync()!);
  int rev=0;
  int rem=0;
  while(num!=0){
    rem = num%10;
    rev = rev*10+rem;
    num = num ~/ 10;
  }
  print("Reversed number is $rev");
}