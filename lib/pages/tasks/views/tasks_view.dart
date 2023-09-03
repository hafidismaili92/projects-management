import 'package:flutter/material.dart';
import 'package:project_management/shared_components/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:project_management/pages/page_layouts/desktop_layout.dart';
import 'package:project_management/pages/tasks/components/taskCard.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> with TickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(children: [
                    Text("Plan : Remise en état du Siège ONCF"),
                    SizedBox(
                      width: 100,
                    ),
                    Expanded(
                        child: TabBar(controller: _controller, tabs: [
                      Tab(text: "Gride"),
                      Tab(text: "Graphique"),
                      Tab(text: "Planning"),
                      Tab(text: "Equipe")
                    ]))
                  ]),
                  SizedBox(height: 80),
                  Expanded(
                    child: new TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: ResponsiveGridRow(
                              children: List.generate(
                                  50,
                                  (index) => ResponsiveGridCol(
                                      lg: 3,
                                      md: 4,
                                      child: Container(
                                        alignment: Alignment(0, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 5),
                                          child: TaskCard(),
                                        ),
                                      )))),
                        ),
                        Text("second"),
                        Text("Third"),
                        Text("Forth"),
                      ],
                    ),
                  ),
                ],
              ))),
    )));
  }
}
