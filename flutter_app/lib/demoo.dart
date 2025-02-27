import 'package:flutter/material.dart';
import 'package:flutter_app/string_const.dart';

class UserLoginRegistrationPage extends StatefulWidget {
  UserLoginRegistrationPage({super.key});

  @override
  State<UserLoginRegistrationPage> createState() =>
      _UserLoginRegistrationPageState();
}

class _UserLoginRegistrationPageState extends State<UserLoginRegistrationPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isRegisterScreen = false;
  var loginText = LOGIN_TEXT;
  var registerText = REGISTER_TEXT;

  GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    print(':::INITSTATE EXEVUTED::::');
    nameController.text = 'DEMO USER';
  }

  @override
  Widget build(BuildContext context) {
    print(':::BUILD EXEVUTED::::');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/download.jpeg'),
              SizedBox(
                height: 50,
              ),
              getTextFormFieldWidget(nameController, 'Enter Phonenumber',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter Phone Number';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              getTextFormFieldWidget(passwordController, 'Enter Password',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Pas sword';
                    }
                    return null;
                  }),
              Visibility(
                visible: isRegisterScreen,
                child: Container(
                  child: getTextFormFieldWidget(
                      confirmPasswordController, 'Enter Confirm Password',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Confirm Password';
                        }
                        return null;
                      }),
                  margin: EdgeInsets.only(top: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {}
                },
                child: Text(
                  loginText,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Are you registered user?'),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      isRegisterScreen = !isRegisterScreen;
                      loginText = isRegisterScreen ? REGISTER_TEXT : LOGIN_TEXT;
                      registerText =
                      isRegisterScreen ? LOGIN_TEXT : REGISTER_TEXT;
                      setState(() {});
                    },
                    child: Text(
                      registerText,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextFormFieldWidget(TextEditingController textController, hintText,
      {validator}) {
    return TextFormField(
      validator: validator,
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
