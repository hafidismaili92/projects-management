import 'package:flutter/material.dart';
import 'package:project_management/pages/page_layouts/mobile_layout.dart';

class DashboardMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(color: Colors.green, height: 80),
              )),
    );
  }
}
