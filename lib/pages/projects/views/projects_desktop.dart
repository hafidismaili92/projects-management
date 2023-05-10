import 'package:flutter/material.dart';
import 'package:project_management/pages/page_layouts/desktop_layout.dart';

class ProjectsDesktopView extends StatefulWidget {
  const ProjectsDesktopView({Key? key}) : super(key: key);

  @override
  State<ProjectsDesktopView> createState() => _ProjectsDesktopViewState();
}

class _ProjectsDesktopViewState extends State<ProjectsDesktopView> {
  @override
  Widget build(BuildContext context) {
    return DesktopLayout(body: Container());
  }
}
