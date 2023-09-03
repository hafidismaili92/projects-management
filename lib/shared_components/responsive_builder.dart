import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:project_management/pages/page_layouts/desktop_layout.dart';
import 'package:project_management/pages/page_layouts/mobile_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (context) => MobileLayout(child: child),
        tablet: (context) => MobileLayout(child: child),
        desktop: (context) => DesktopLayout(child: child));
  }
}
