import 'package:flutter/material.dart';

class Demo1 extends StatelessWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex:3,
                      child: Container(
                        color: Colors.brown,
                      )),
                  Expanded(child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              color: Colors.lightBlueAccent,
                            ))
                      ]
                  ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.yellowAccent,
                      )),
                  Expanded(child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Container(
                                color: Colors.lightBlueAccent,
                              )),
                              Expanded(child: Container(
                                color: Colors.purple,
                              ))
                            ],
                          ),
                        ),
                        Expanded(child: Column(
                          children: [
                            Expanded(child: Container(
                              color: Colors.deepPurpleAccent,
                            )),
                            Expanded(child: Container(
                              color: Colors.red,
                            ))
                          ],
                        ))
                      ]
                  )),
                  Expanded(
                      child: Container(
                        color: Colors.purple,
                      ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                      )),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Container(
                                color: Colors.lightBlueAccent,
                              )),
                              Expanded(child: Container(
                                color: Colors.purple,
                              ))
                            ],
                          ),
                        ),
                        Expanded(child: Column(
                          children: [
                            Expanded(child: Container(
                              color: Colors.deepPurpleAccent,
                            )),
                            Expanded(child: Container(
                              color: Colors.red,
                            ))
                          ],
                        ))
                      ]
                  )),
                  Expanded(
                      child: Container(
                        color: Colors.brown,
                      )),
                  Expanded(child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Container(
                                color: Colors.lightBlueAccent,
                              )),
                              Expanded(child: Container(
                                color: Colors.purple,
                              ))
                            ],
                          ),
                        ),
                        Expanded(child: Column(
                          children: [
                            Expanded(child: Container(
                              color: Colors.deepPurpleAccent,
                            )),
                            Expanded(child: Container(
                              color: Colors.red,
                            ))
                          ],
                        ))
                      ]
                  )),
                ],
              )),
        ],
      ),
    );
  }
}
