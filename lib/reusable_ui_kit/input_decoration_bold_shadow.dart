import 'package:flutter/material.dart';

class InputDecorationBoldShabow extends StatelessWidget {
  final Widget child;
  final String labelText;
  const InputDecorationBoldShabow(
      {super.key, required this.child, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurStyle: BlurStyle.solid,
                  blurRadius: 1,
                  offset: Offset(0, 5))
            ]),
        child: child,
      ),
    );
  }
}
