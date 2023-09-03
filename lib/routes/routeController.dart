import 'package:flutter/material.dart';
//routeNames
import 'package:project_management/routes/routeNames.dart' as routeNames;

//guards
import 'package:project_management/middlewares/guards.dart' as appGuards;
//pages
import 'package:project_management/pages/authChecker/authCheckerView.dart';
import 'package:project_management/pages/projects/views/projects_view.dart';
import 'package:project_management/pages/tasks/views/tasks_view.dart';
import 'package:project_management/pages/team/views/team_view.dart';
import '../pages/register/views/register_view.dart';
import '../pages/login/views/login_view.dart';
// Control our page route flow

//TODO:apply guards
Route<dynamic> RouteController(RouteSettings settings) {
  switch (settings.name) {
    case routeNames.checkAuthRoute:
      return MaterialPageRoute(builder: (context) => AuthCheckerView());
    case routeNames.loginRoute:
      return MaterialPageRoute(
          builder: (context) => applyGuards([appGuards.notAuthenticated],
              LoginView(), Container(child: Text("not allowed"))));
    case routeNames.registerRoute:
      return MaterialPageRoute(
          builder: (context) => applyGuards([appGuards.notAuthenticated],
              RegisterView(), Container(child: Text("not allowed"))));
    case routeNames.plansHub:
      return MaterialPageRoute(
          builder: (context) => applyGuards([appGuards.notAuthenticated],
              ProjectsView(), Container(child: Text("not allowed"))));
    case routeNames.tasksRoute:
      return MaterialPageRoute(
          builder: (context) => applyGuards([appGuards.notAuthenticated],
              TasksView(), Container(child: Text("not allowed"))));
    case routeNames.teamRoute:
      return MaterialPageRoute(
          builder: (context) => applyGuards([appGuards.notAuthenticated],
              TeamView(), Container(child: Text("not allowed"))));
    default:
      throw ('This route name does not exit');
  }
}

Widget applyGuards(
    List<String> guards, Widget destination, Widget onFailScreen) {
  for (String guardName in guards) {
    if (appGuards.checkGuardMethods.containsKey(guardName)) {
      if (appGuards.checkGuardMethods[guardName]!() == false) {
        return onFailScreen;
      }
    }
  }
  return destination;
}
