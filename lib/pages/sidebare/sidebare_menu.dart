import 'package:flutter/material.dart';
import 'package:project_management/shared_components/selectionnable.dart';
import 'package:project_management/themes/textStyles.dart';

class SidebareMenu extends StatelessWidget {
  String title;
  bool isActive;
  IconData activeIcon;
  IconData icon;
  Function() onSelect;
  SidebareMenu(
      {required this.title,
      required this.isActive,
      required this.activeIcon,
      required this.icon,
      required this.onSelect});
  @override
  Widget build(BuildContext context) {
    IconData menuIcon;
    Color? menuColor;
    Color? textColor;
    if (isActive) {
      menuIcon = activeIcon;
      menuColor = Theme.of(context).colorScheme.outlineVariant;
      textColor = Theme.of(context).colorScheme.inversePrimary;
    } else {
      menuIcon = icon;
      textColor = Theme.of(context).colorScheme.onPrimary;
    }
    return Selectionnable(
        onSelect: onSelect,
        builder: (isHoverd) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (isHoverd & !isActive)
                    ? Theme.of(context).colorScheme.secondary
                    : menuColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
                child: Row(children: [
                  Icon(
                    menuIcon,
                    color: textColor,
                  ),
                  SizedBox(width: 25),
                  Expanded(
                      child: Text(
                    title.toString(),
                    style: TextStyles.menuTextStyle
                        .merge(TextStyle(color: textColor)),
                  ))
                ]),
              ),
            ));
  }
}
