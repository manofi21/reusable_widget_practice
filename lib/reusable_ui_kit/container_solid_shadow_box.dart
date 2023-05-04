import 'package:flutter/material.dart';

class ContainerSolidShadowBox extends StatelessWidget {
  final Widget? child;
  final Color color;
  const ContainerSolidShadowBox({
    super.key,
    this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
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
    );
  }
}
