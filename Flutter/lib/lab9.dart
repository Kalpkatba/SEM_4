import 'package:flutter/material.dart';

import 'lab7.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        // children: [
          // Expanded(
    //           child: Container(
    //               ElevatedButton(onPressed: (){
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context){
    //                       return Lab7_12();
    //                     }));
    //
    //               }, child: Text('About_Page'))
    // ))
    //     ],
      )
      );

  }
}
