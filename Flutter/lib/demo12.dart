import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserEntryFormPage extends StatelessWidget {
  UserEntryFormPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> _fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Valid Name';
                  }
                  return null;
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(color: Colors.red),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email Address';
                  }
                  if (!RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return 'Enter Valid Email address';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[A-Z]'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Phone Number';
                  }
                  if (value.length != 10) {
                    return 'Enter Valid Phone Number';
                  }
                  return null;
                },
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  print('IS VALIDATE : ${_fromKey.currentState!.validate()}');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
