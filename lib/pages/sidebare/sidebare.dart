import 'package:flutter/material.dart';
import 'package:project_management/services/api/authService.dart';
import 'package:provider/provider.dart';

import 'package:project_management/providers/viewIndex.dart';
import 'package:project_management/constants/app_constants.dart';
import 'package:project_management/routes/routeNames.dart' as routeNames;
import 'package:project_management/pages/sidebare/sidebare_menu.dart';
import 'package:project_management/routes/routeNames.dart' as RouteNames;
import 'package:project_management/shared_components/appLoader.dart';
import 'package:project_management/services/api/apiClient.dart';

class Sidebare extends StatefulWidget {
  const Sidebare({Key? key}) : super(key: key);

  @override
  State<Sidebare> createState() => _SidebareState();
}

class _SidebareState extends State<Sidebare> {
  bool showLoader = false;
  final data = [
    {
      "title": "Plans Hub",
      "activeIcon": Icons.menu_book,
      "icon": Icons.remove,
      "route": routeNames.plansHub
    },
    {
      "title": "Tasks",
      "activeIcon": Icons.access_alarm,
      "icon": Icons.ac_unit,
      "route": routeNames.tasksRoute
    },
    {
      "title": "Team",
      "activeIcon": Icons.group_outlined,
      "icon": Icons.group,
      "route": routeNames.teamRoute
    }
  ];

  void logout() {
    setState(() {
      showLoader = true;
    });
    ApiClient client = Provider.of<ApiClient>(context, listen: false);
    AuthService auth = AuthService(apiClient: client);
    auth.logout((resp) {
      Navigator.pushNamed(context, routeNames.loginRoute);
    }, (resp) {
      setState(() {
        showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer);
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: showLoader
          ? Center(
              child: AppLoader(
                  color: Theme.of(context).colorScheme.onSecondaryContainer))
          : Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                          radius: 30,
                        ),
                        SizedBox(width: 25),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("HAFID ISMAILI", style: txtStyle),
                              Text("Project manager", style: txtStyle)
                            ])
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                      children: data.asMap().entries.map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SidebareMenu(
                          title: e.value["title"].toString(),
                          isActive:
                              context.watch<ViewIndex>().currentIndex == e.key,
                          activeIcon: e.value["activeIcon"] as IconData,
                          icon: e.value["icon"] as IconData,
                          onSelect: () {
                            context.read<ViewIndex>().currentIndex = e.key;
                            Navigator.pushNamed(
                                context, e.value["route"] as String);
                          }),
                    );
                  }).toList()),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        logout();
                      },
                      child: SidebareMenu(
                        title: "Logout",
                        isActive: false,
                        activeIcon: Icons.logout,
                        icon: Icons.logout,
                      ))
                ],
              ),
            ),
    );
  }
}
