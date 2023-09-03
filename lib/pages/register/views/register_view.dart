import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:project_management/constants/app_constants.dart';
import 'package:project_management/shared_components/appFormField.dart';
import 'package:project_management/shared_components/roundedButton.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  void signUp() {
    if (_formKey.currentState!.validate()) {
      print("oko");
    } else {
      print("bad");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fieldsSpace = kVerticalSpace["small"]!;
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
              child: SingleChildScrollView(
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
                                  onChange: (value) => _email = value,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ])),
                              SizedBox(
                                height: fieldsSpace,
                              ),
                              AppFormField(
                                  icon: Icon(Icons.password),
                                  hint: "Password",
                                  isHiddeField: true,
                                  onChange: (value) => _password = value,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(8),
                                  ])),
                              SizedBox(
                                height: fieldsSpace,
                              ),
                              AppFormField(
                                  icon: Icon(Icons.password),
                                  hint: "Confirm Password",
                                  isHiddeField: true,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    (value) {
                                      if (value != _password) {
                                        return "password confirmation dont match";
                                      }
                                    }
                                  ])),
                              SizedBox(
                                height: fieldsSpace,
                              ),
                              RoundedButton(text: "Sign Up", onPressed: signUp),
                            ])),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
