import 'dart:io';

void main(){
  print("Enter a String :");
  String st = (stdin.readLineSync()!);
  String reversed = "";
  for(int i = st.length-1 ; i >= 0 ; i--){
    reversed += st[i];
  }
  print("Orignal String is $st");
  print("Reversed String is $reversed");
}