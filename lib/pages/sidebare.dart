import 'package:flutter/material.dart';
import 'package:project_management/constants/app_constants.dart';
import 'package:project_management/shared_components/selectionnable.dart';
import 'package:project_management/pages/sidebare/sidebare_menu.dart';

class Sidebare extends StatefulWidget {
  const Sidebare({Key? key}) : super(key: key);

  @override
  State<Sidebare> createState() => _SidebareState();
}

class _SidebareState extends State<Sidebare> {
  int selectedIndex = 0;
  final data = [
    {"title": "menu 1", "activeIcon": Icons.menu_book, "icon": Icons.remove},
    {"title": "menu 2", "activeIcon": Icons.access_alarm, "icon": Icons.ac_unit}
  ];
  void setSidebarIndex(newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtStyle = TextStyle(color: kFontColorPallets[1], letterSpacing: .8);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
                radius: 30,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 25),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("HAFID ISMAILI", style: txtStyle),
                Text("Project manager", style: txtStyle)
              ])
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Divider(
            thickness: 3,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
            children: data.asMap().entries.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SidebareMenu(
                title: e.value["title"].toString(),
                isActive: selectedIndex == e.key,
                activeIcon: e.value["activeIcon"] as IconData,
                icon: e.value["icon"] as IconData,
                onSelect: () => setSidebarIndex(e.key)),
          );
        }).toList()),
      ],
    );
  }
}
