import 'package:flutter/material.dart';
import 'package:project_management/shared_components/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:project_management/themes/inputDecorations.dart';
import 'package:project_management/pages/projects/components/projectCard.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView>
    with TickerProviderStateMixin {
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
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 3,
                      child: Text(
                        "My Plans Hub",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Container(
                            width: responsiveValue(context,
                                xs: double.infinity, md: 350),
                            child: TextField(
                              style: Theme.of(context).textTheme.labelMedium,
                              decoration: AppInputDecorations.roundedInput(
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).colorScheme.primary)
                                  .copyWith(
                                      prefixIcon: Icon(Icons.search),
                                      label: Text("Search")),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: responsiveValue(context, xs: 30, md: 80),
        ),
        Expanded(
          child: Container(
              child: ResponsiveGridList(
                  desiredItemWidth: 280,
                  physics: BouncingScrollPhysics(),
                  scroll: true,
                  minSpacing: responsiveValue(context, xs: 1, sm: 5, md: 25),
                  children: List.generate(
                      50,
                      (index) => Container(
                            alignment: Alignment(0, 0),
                            child: ProjectCard(
                                text:
                                    "Construction d'un Immeuble R+9 à kenitre y compris les plans d'éxecution"),
                          )))),
        ),
      ],
    ));
  }
}
