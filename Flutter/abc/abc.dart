import 'anonymous.dart';

void main() {
  // print('ANS OF TWO NUMBER ADDITION : ${additionOfTwoNo(10, c: 20)}');
  Anonymous anonymous = Anonymous();
  anonymous.additionOfTwoNumbers(
      b: 20,
      a: 10,
      callbackFunction: (element) {
        print('ANONYMOUS FUNCTION CALLBACK : $element');
      });
  anonymous.additionOfTwoNo(90, c: 20);

  // var a;
  // a = '10';
  // a = 10;
  List<Map<String, dynamic>> userList = [
    {'Name': 'Hello', 'Height': 101},
    {'Name': 'Hello1', 'Height': 182}
  ];
  userList.add({'Name': 'Hello3', 'Height': 192});
  userList.forEach((element) {
    print('${element['Name']} => ${element['Height']}');
  });

  // for (dynamic element in userList) {
  //   print(element['Height']);
  // }

  // dynamic b = [
  //   {'a': 10}
  // ];
  // b = 'DATA';
}

additionOfTwoNumbers(int b, [int? a = 0, int? c]) => a! + b;

int? additionOfTwoNo(int b, {int? a = 0, required int c}) => a! + b;
