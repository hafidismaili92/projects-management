import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:project_management/providers/userDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:project_management/constants/api_constants.dart';
import 'package:project_management/services/api/apiClient.dart';
import 'package:project_management/providers/viewIndex.dart';
import 'package:project_management/themes/theme.dart';
import 'package:project_management/routes/routeNames.dart' as routeNames;
import 'package:project_management/routes/routeController.dart';
import 'package:project_management/constants/app_constants.dart';

void main() {
  const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  ApiClient apiClient = ApiClient(baseUrl: kbaseUrl);
  if (kIsWeb) {
    //if web app we must establish a session based (session cookies) auth with laravel sanctum
    apiClient.setupWebClient();
  }

  runApp(DevicePreview(
    enabled: true,
    builder: (BuildContext context) => MultiProvider(providers: [
      Provider(create: (context) => apiClient),
      ChangeNotifierProvider(create: (_) => ViewIndex()),
      ChangeNotifierProvider(create: (_) => UserDataProvider())
    ], child: App()),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme(mainColor: kAppColorSeeds["red"]!);
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        //initialRoute: routeNames.checkAuthRoute,
        initialRoute: routeNames.teamRoute,
        onGenerateRoute: RouteController,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.system);
  }
}
