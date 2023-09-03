import 'package:flutter/material.dart';

import 'package:project_management/providers/userDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:project_management/models/user.dart';
import 'package:project_management/routes/routeNames.dart' as routeNames;
import 'package:project_management/services/api/authService.dart';
import 'package:project_management/shared_components/appLoader.dart';
import 'package:project_management/services/api/apiClient.dart';

class AuthCheckerView extends StatefulWidget {
  @override
  State<AuthCheckerView> createState() => _AuthCheckerViewState();
}

class _AuthCheckerViewState extends State<AuthCheckerView> {
  bool? isAuthenticated;
  String errorMsg = '';
  void checkAuth(BuildContext context) async {
    setState(() {
      errorMsg = '';
    });
    ApiClient client = Provider.of<ApiClient>(context, listen: false);
    AuthService auth = AuthService(apiClient: client);

    Map<String, dynamic> data = await auth.getAuthenticatedUser();
    User? currentUser = data['user'];

    if (currentUser != null) {
      if (context.mounted) {
        Provider.of<UserDataProvider>(context, listen: false).user =
            currentUser;
        Navigator.pushNamed(context, routeNames.plansHub);
      }
    } else if (!data['serverContacted']) {
      setState(() {
        errorMsg = data['error'];
      });
    } else {
      setState(() {
        Navigator.pushNamed(context, routeNames.loginRoute);
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkAuth(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //wait for build to complete

    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          errorMsg.isEmpty ? AppLoader() : Container(),
          Text(
            errorMsg,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          !errorMsg.isEmpty
              ? FilledButton(
                  onPressed: () {
                    checkAuth(context);
                  },
                  child: Text('Retry'))
              : Container()
        ],
      ))),
    );
  }
}
