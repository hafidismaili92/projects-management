import 'package:flutter/material.dart';
import 'package:project_management/pages/sidebare/sidebare.dart';

class DesktopLayout extends StatelessWidget {
  Widget? child;
  DesktopLayout({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 350,
            child: Sidebare(),
          ),
          Expanded(
            child: Column(
              children: [
                //header
                Header(), //header
                Expanded(
                    child: Container(
                        child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
                  child: child,
                ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.centerLeft,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Bienvenue HAFID ISMAILI",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ));
  }
}
