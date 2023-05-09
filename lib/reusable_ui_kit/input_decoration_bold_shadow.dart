import 'package:flutter/material.dart';

class InputDecorationBoldShabow extends StatelessWidget {
  final Widget child;
  final String labelText;
  final Widget? counter;
  final bool defaultCounter;
  final Widget? sidesLabelWidget;
  const InputDecorationBoldShabow(
      {super.key,
      required this.child,
      required this.labelText,
      this.counter,
      this.defaultCounter = false,
      this.sidesLabelWidget});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        label: Row(
          children: [
            Text(labelText),
            const SizedBox(width: 10),
            sidesLabelWidget ?? Container(),
          ],
        ),
        border: InputBorder.none,
        counter: counter == null && !defaultCounter ? Container() : counter,
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
                offset: Offset(0, 5),
              )
            ]),
        child: child,
      ),
    );
  }
}
