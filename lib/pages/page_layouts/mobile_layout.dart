import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mobileView"),
        backgroundColor: Colors.pink,
      ),
      body: child,
      drawer: Text('im a mobile drawer'),
    );
  }
}
