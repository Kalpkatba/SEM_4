import 'dart:io';

void main(){
  List<int> demo_list = [];
  stdout.write("Enter How many number you want to enter : ");
  int? n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int? num1 = int.parse(stdin.readLineSync()!);
    if (num1 != null) {
      demo_list.add(num1);
    } else {
      print("Invalid input. Please enter a valid number.");
      i--;
    }
  }
  for(int i = 0; i < n; i++){
     if(demo_list[i]%3==0 || demo_list[i]%5==0){
       print(demo_list[i]);
     }
  }
}