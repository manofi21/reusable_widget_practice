import 'package:flutter/material.dart';

class ContainerOutlinetShdowBox extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double? height;
  final double? width;
  const ContainerOutlinetShdowBox({
    super.key,
    this.child,
    this.color = Colors.white,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(3, 6),
          )
        ],
      ),
      child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: color, width: 1.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          child: child),
    );
  }
}
