import 'package:flutter/material.dart';

class Lab7_1 extends StatelessWidget {
  const Lab7_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.green,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.lightBlueAccent,
                      ))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.brown,
                      )),
                  Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.blueGrey,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.purple,
                      ))
                ],
              )),
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.orange,
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
