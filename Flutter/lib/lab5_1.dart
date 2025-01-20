import 'dart:io';

void main() {
  List<int> numb = [];

  print("Enter 5 numbers:");

  for (int i = 0; i < 5; i++) {
    stdout.write("Enter number ${i + 1}: ");
    int? num = int.parse(stdin.readLineSync()!);
    if (num != null) {
      numb.add(num);
    } else {
      print("Invalid input. Please enter a valid number.");
      i--;
    }
  }

  for (int i = 0; i < numb.length - 1; i++) {
    for (int j = 0; j < numb.length - i - 1; j++) {
      if (numb[j] > numb[j + 1]) {
        int temp = numb[j];
        numb[j] = numb[j + 1];
        numb[j + 1] = temp;
      }
    }
  }
  print("\nNumbers in increasing order: $numb");
}
