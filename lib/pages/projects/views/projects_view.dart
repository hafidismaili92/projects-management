import 'package:flutter/material.dart';
import 'package:project_management/models/plan.dart';
import 'package:project_management/pages/projects/views/newProjectView.dart';
import 'package:project_management/services/api/apiClient.dart';
import 'package:project_management/services/api/plansService.dart';
import 'package:project_management/shared_components/modalLayout.dart';
import 'package:project_management/shared_components/responsive_builder.dart';
import 'package:project_management/shared_components/roundedIconButton.dart';
import 'package:project_management/themes/buttonsStyle.dart';
import 'package:provider/provider.dart';
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
  // late final TabController _controller;
  List<Plan> plans = [];
  ApiClient? client;
  PlansService? pService;
  bool isFirstLoading = false;
  bool isLoadingMore = false;
  int page = 1;
  bool hasMore = true;
  late ScrollController _controller;
  void getPlans() async {
    Map<String, dynamic> dta = await pService!.fetchUserPlans(page);
    if (dta['error'] == '') {
      setState(() {
        plans.addAll(dta['plans']);
      });
      if (plans.length >= dta['total']) {
        setState(() {
          hasMore = false;
        });
      }
      page++;
    } else {
      print(dta['error']);
    }
    setState(() {
      isFirstLoading = false;
      isLoadingMore = false;
    });
  }

  void loadMorePlans() {
    if (!hasMore || isFirstLoading || isLoadingMore) {
      return;
    } else {
      if (_controller.position.extentAfter < 300) {
        setState(() {
          isLoadingMore = true;
        });
        getPlans();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(loadMorePlans);
    client = Provider.of<ApiClient>(context, listen: false);
    pService = PlansService(apiClient: client!);
    setState(() {
      isFirstLoading = true;
    });
    getPlans();
  }

  dynamic _showNewProjectModal(BuildContext context) async {
    // show the modal dialog and pass some data to it
    final result =
        await Navigator.of(context).push(buildModal(child: NewProjectView()));
    //
    // // print the data returned by the modal if any
    // debugPrint(result.toString());
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
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Plans Hub",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      RoundedIconButton(
                          onTap: () => _showNewProjectModal(context),
                          icon: Icons.add)
                    ],
                  ),
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
              child: isFirstLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        ResponsiveGridList(
                            controller: _controller,
                            desiredItemWidth: 280,
                            //physics: BouncingScrollPhysics(),
                            scroll: true,
                            minSpacing:
                                responsiveValue(context, xs: 1, sm: 5, md: 25),
                            children: plans
                                .map((plan) => Container(
                                      alignment: Alignment(0, 0),
                                      child: ProjectCard(
                                          title: plan.title,
                                          description: plan.description),
                                    ))
                                .toList()),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: (hasMore && isLoadingMore)
                                    ? Container(
                                        width: 25,
                                        height: 25,
                                        child: CircularProgressIndicator(
                                          semanticsLabel: 'Loading',
                                        ))
                                    : Container()))
                      ],
                    )),
        ),
      ],
    ));
  }
}
