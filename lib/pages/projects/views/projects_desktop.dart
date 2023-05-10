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
    return DesktopLayout(
        body: Container(
            child: Row(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        ),
      )),
      Container(width: 350),
    ])));
  }
}
