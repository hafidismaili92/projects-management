import 'package:flutter/material.dart';
import 'package:project_management/shared_components/responsive_builder.dart';
import 'package:project_management/pages/dashboard/views/dashboard_desktop.dart';
import 'package:project_management/pages/dashboard/views/dashboard_tablet.dart';
import 'package:project_management/pages/dashboard/views/dashboard_mobile.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreen(
      mobileScreen: DashboardMobileView(),
      tabletScreen: DashboardTabletView(),
      desktopScreen: DashboardDesktopView(),
    );
  }
}
