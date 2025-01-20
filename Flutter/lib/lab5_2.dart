import 'dart:io';

void main() {
  List<int> numb1 = [];
  List<int> numb2 = [];
  print("Enter 5 numbers:");

  for (int i = 0; i < 5; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int? num1 = int.parse(stdin.readLineSync()!);
    if (num1 != null) {
      numb1.add(num1);
    } else {
      print("Invalid input. Please enter a valid number.");
      i--;
    }
  }
  for (int i = 0; i < 5; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int? num2 = int.parse(stdin.readLineSync()!);
    if (num2 != null) {
      numb2.add(num2);
    } else {
      print("Invalid input. Please enter a valid number.");
      i--;
    }
  }

  for(int i = 0 ; i < 5 ; i++){
    for(int j = 0 ; j < 5 ; j++){
        if(numb1[i]==numb2[j]){
          print(numb1[i]);
        }
    }
  }

}