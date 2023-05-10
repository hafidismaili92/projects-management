import 'package:flutter/material.dart';
import 'package:project_management/pages/sidebare.dart';

class DesktopLayout extends StatelessWidget {
  Widget? body;
  DesktopLayout({required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 350,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Sidebare(),
            ),
          ),
          Expanded(
            child: Container(child: body),
          ),
        ],
      ),
    );
  }
}
