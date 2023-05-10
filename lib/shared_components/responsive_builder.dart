import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveScreen extends StatelessWidget {
  ResponsiveScreen(
      {required this.mobileScreen,
      required this.tabletScreen,
      required this.desktopScreen});
  Widget mobileScreen;
  Widget tabletScreen;
  Widget desktopScreen;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (context) => mobileScreen,
        tablet: (context) => tabletScreen,
        desktop: (context) => desktopScreen);
  }
}
