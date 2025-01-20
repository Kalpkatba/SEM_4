class Anonymous {
  void additionOfTwoNumbers(
      {required int a, required int b, required Function callbackFunction}) {
    int c = a + b;
    callbackFunction(0);
    print('VALUE OF TWO NUMBER ADDITION : $c');
  }

  int? additionOfTwoNo(int b, {int? a = 0, required int c}) => a! + b;
}
