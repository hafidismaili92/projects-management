import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:project_management/providers/viewIndex.dart';
import 'package:project_management/themes/theme.dart';
import 'package:project_management/routes/routeNames.dart' as routeNames;
import 'package:project_management/routes/routeController.dart';
import 'package:project_management/constants/app_constants.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ViewIndex())],
      child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme(mainColor: kAppColorSeeds["red"]!);
    return MaterialApp(
        initialRoute: routeNames.loginRoute,
        onGenerateRoute: RouteController,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.light);
  }
}
