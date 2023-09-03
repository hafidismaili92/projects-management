import 'package:flutter/material.dart';
import 'package:project_management/models/apiResponse.dart';
import 'package:provider/provider.dart';
import 'package:project_management/routes/routeNames.dart' as RouteNames;
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project_management/shared_components/appFormField.dart';
import 'package:project_management/shared_components/roundedButton.dart';
import 'package:project_management/services/api/authService.dart';
import 'package:project_management/shared_components/appLoader.dart';
import 'package:project_management/services/api/apiClient.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMsg = '';

  bool showLoader = false;
  void login() async {
    setState(() {
      showLoader = true;
    });
    if (_formKey.currentState!.validate()) {
      ApiClient client = Provider.of<ApiClient>(context, listen: false);
      AuthService auth = AuthService(apiClient: client);
      auth.login(
          email,
          password,
          (ApiResponse resp) =>
              Navigator.pushNamed(context, RouteNames.tasksRoute),
          (ApiResponse resp) {
        setState(() {
          showLoader = false;
          errorMsg = resp.isServerContacSuccess
              ? 'Can\'t login, please Check your Credentials'
              : 'Connection to server Faild, Check your connection';
        });
      });
    }
  }

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
                  child: showLoader
                      ? AppLoader()
                      : Container(
                          width:
                              size.width > 1.2 * 350 ? 350 : size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !errorMsg.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 25,
                                      ),
                                      child: Text(errorMsg,
                                          style: TextStyle(color: Colors.red)),
                                    )
                                  : Container(),
                              Form(
                                  key: _formKey,
                                  child: Column(children: [
                                    AppFormField(
                                      icon: Icon(Icons.email),
                                      hint: "Email here",
                                      onChange: (value) {
                                        email = value;
                                        setState(() {
                                          errorMsg = '';
                                        });
                                      },
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    AppFormField(
                                      icon: Icon(Icons.password),
                                      hint: "Password",
                                      isHiddeField: true,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      onChange: (value) {
                                        password = value;
                                        setState(() {
                                          errorMsg = '';
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    RoundedButton(
                                        text: "Login", onPressed: login),
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
