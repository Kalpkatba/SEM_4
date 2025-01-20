import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Hello"),
      ),
          body: Text("How are you?, i am fine.",style: TextStyle(
            fontSize: 50.2,
            color: Colors.red,
              backgroundColor: Colors.black,
              fontStyle: FontStyle.italic
          ),),
      bottomNavigationBar: Text("Footer"),
      );
  }
}