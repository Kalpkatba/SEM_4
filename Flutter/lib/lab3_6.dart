import 'dart:io';

void main(){
  int even = 0;
  int odd = 0;

  while(true){
    print("Enter a list of numbers");
    int? num = int.parse(stdin.readLineSync()!);
    if(num == 0){
      break;
    }
    else if(num>0 && num%2==0){
      even += num;
    }
    else if(num<0 && num%2!=0){
      odd += num;
    }
  }
  print("Sum of even is $even");
  print("Sum of odd is $odd");
}