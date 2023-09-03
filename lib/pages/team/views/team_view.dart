import 'package:flutter/material.dart';
import 'package:project_management/pages/team/views/largeChatScreen.dart';
import 'package:project_management/pages/team/views/smallChatScreen.dart';
import 'package:project_management/shared_components/responsive_builder.dart';

class TeamView extends StatefulWidget {
  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ResponsiveLayout(
          child: MediaQuery.of(context).size.width < 1200
              ? SmallChatScreen()
              : LargeChatScreen());
    });
    //return DesktopLayout(body: Center(child: Text("hi from team View")));
    return ResponsiveLayout(child: SmallChatScreen());
  }
}
