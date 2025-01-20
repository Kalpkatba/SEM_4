import 'dart:io';

class Data{
  List<Map<String,dynamic>> list = [];
  void insertData({required String name , required String number}){
    Map<String,dynamic> m = {};
    m['Name'] = name;
    m['number'] = number;
    list.add(m);
  }
  List<Map<String,dynamic>> getAllData(){
    return list;
  }
}

void main(){
  stdout.write("Choice:\n 1 for Add User Name \n 2 for get all data \n 3 for exit \n");
  stdout.write("Enter your Choice:");
  int n = int.parse(stdin.readLineSync()!);

  Data d = Data();
  while(n!=0){
    if(n==1){
      stdout.write("Enter Name:");
      String name = stdin.readLineSync()!;
      stdout.write("Enter number:");
      String number = stdin.readLineSync()!;
      d.insertData(name: name,number: number);
    }
    else if(n==2){
      print(d.getAllData());
    }
    else if(n==3){
      break;
    }
    else{
      print("enter valid choic");
    }
    stdout.write("Enter your Choice:");
    n = int.parse(stdin.readLineSync()!);
  }
}