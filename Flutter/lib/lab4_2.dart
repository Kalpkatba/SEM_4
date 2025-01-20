import 'dart:io';

void max(int a,int b){
  if(a>b){
    print("$a is bigger than $b");
  }
  else{
    print("$b is bigger than $a");
  }
}
void main(){
  stdout.write("Enter Number A : ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Number B : ");
  int b = int.parse(stdin.readLineSync()!);
  max(a, b);
}