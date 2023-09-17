import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  void Function()? onTap;
  IconData? icon;
  RoundedIconButton({this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(12),
        ),
        onPressed: onTap,
        child: Icon(icon));
  }
}
