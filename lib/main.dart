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
//import OneSignal
import 'package:onesignal_flutter/onesignal_flutter.dart';

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

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    initOneSignal();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme(mainColor: kAppColorSeeds["clairMauve"]!);
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        //initialRoute: routeNames.checkAuthRoute,
        initialRoute: routeNames.plansHub,
        onGenerateRoute: RouteController,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.system);
  }

  void initOneSignal() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize(kOneSignalAppId);

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);
  }
}
