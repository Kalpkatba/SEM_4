import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_programing/lab9.dart';

class Lab7_12 extends StatelessWidget {
   Lab7_12({super.key});

  GlobalKey<FormState> _formkey = GlobalKey();

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
      body: Form(
          key: _formkey,
          child: Column(
            children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'Enter valid name';
                }
                return null;
              },

            ),SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email address';
                  }
                  if (!RegExp(r'[a-z0-9]+@gmail\.com$').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null; // Return null if the input is valid
                },
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter phone number';
                  }
                  if (value.length != 10) {
                    return 'Enter a valid 10-digit number';
                  }
                  if (!RegExp(r'[0-9]$').hasMatch(value)) {
                    return 'Enter digits only';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Image.asset('assets/images/images.jpg');
                  print('IS VALIDATE : ${_formkey.currentState!.validate()}');
                },
                 child: Text('Submit'),
              ),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);

              }, child: Text('Home Page'))
            ],
          ),
      ),
    );
  }
}
