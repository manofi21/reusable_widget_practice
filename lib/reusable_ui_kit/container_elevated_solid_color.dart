import 'package:flutter/material.dart';
/// Try to impersonet UI from : https://github.com/donayxsmall/uikit_form
class ContainerElevatedSolidColor extends StatelessWidget {
  final Color? color;
  final Widget child;
  const ContainerElevatedSolidColor(
      {super.key, this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: child,
      ),
    );
  }
}
