import 'package:flutter/material.dart';
import 'package:project_management/shared_components/appFormField.dart';
import 'package:project_management/shared_components/roundedButton.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/signup_top.png",
                width: size.width < 800 ? size.width * 0.3 : size.width * 0.15,
                fit: BoxFit.fill),
          ),
          Container(
            child: Center(
              child: Center(
                  child: Container(
                width: size.width > 1.2 * 350 ? 350 : size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          AppFormField(
                            icon: Icon(Icons.email),
                            hint: "Email here",
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          AppFormField(
                            icon: Icon(Icons.password),
                            hint: "Password",
                            isHiddeField: true,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RoundedButton(
                              text: "Login", onPressed: () => print('hello')),
                        ])),
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
