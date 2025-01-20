import 'dart:io';

void main(){
  print("Enter Start :");
  int? start = int.parse(stdin.readLineSync()!);
  print("Enter End :");
  int? end = int.parse(stdin.readLineSync()!);
  for(int i = start ; i <= end ; i++){
    int count = 0;
    for(int j = 1 ; j<=i ; j++) {
      if (i%j == 0){
        count ++;
      }
    }
    if(count==2) {
      stdout.write(i);
    }
  }
}