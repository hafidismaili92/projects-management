import 'package:flutter/material.dart';

class Selectionnable extends StatefulWidget {
  Function()? onSelect;
  Widget Function(bool isHoverd) builder;
  Selectionnable({required this.onSelect, required this.builder});
  @override
  State<Selectionnable> createState() => _SelectionnableState();
}

class _SelectionnableState extends State<Selectionnable> {
  bool isHoverd = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => setState(() {
        isHoverd = true;
      }),
      onExit: (e) => setState(() {
        isHoverd = false;
      }),
      child: GestureDetector(
          onTap: widget.onSelect, child: widget.builder(isHoverd)),
    );
  }
}
