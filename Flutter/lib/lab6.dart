import 'package:flutter/material.dart';

class Lab6 extends StatelessWidget {
  const Lab6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.white,
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
                              )),
                              Expanded(child: Container(
                                color: Colors.black,
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
                            )),
                            Expanded(child: Container(
                              color: Colors.blue,
                            ))
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Container(
                                color: Colors.lightBlueAccent,
                              )),
                              Expanded(child: Container(
                                color: Colors.purple,
                              )),
                              Expanded(child: Container(
                                color: Colors.yellowAccent,
                              ))
                            ],
                          ),
                        )
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
                        color: Colors.red,
                      )),
                  Expanded(
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
