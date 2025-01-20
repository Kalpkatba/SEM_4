import 'dart:io';

void countevenodd(List<int> number){
  int even = 0;
  int odd = 0;
  for(int num in number){
    if(num%2==0){
      even++;
    }
    else{
      odd++;
    }
  }
  print("Even count is $even");
  print("odd count is $odd");
}

void main(){
  stdout.write("Enter size of array : ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> number = [];
  for(int i = 1; i<=n ; i++){
    stdout.write("Enter $i element : ");
    int num = int.parse(stdin.readLineSync()!);
    number.add(num);
  }
}