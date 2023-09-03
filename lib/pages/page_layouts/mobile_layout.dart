import 'package:flutter/material.dart';
import 'package:project_management/pages/sidebare/sidebare.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text("mobileView"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
        child: child,
      ),
      drawer: Sidebare(),
    );
  }
}
