import 'package:flutter/material.dart';
import 'package:project_management/themes/theme.dart';
import 'package:project_management/pages/projects/views/projects_desktop.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ProjectsDesktopView(),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light);
  }
}
