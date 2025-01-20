import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabCon extends StatelessWidget {
  const TabCon({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('sdjdvnsj'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'Tab1',
              ),
              Tab(
                text: 'Tab2',
              ),
              Tab(
                text: 'Tab3',
              )
            ]),
          ),
          body: TabBarView(children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Alert"),
                                content: Text("Demooo"),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(CupertinoIcons.back))
                                ],
                              );
                            });
                      },
                      child: Text('Demo')),
                ]),
            Text("demo"),
            Text("demo")
          ]),
        ));
  }
}
