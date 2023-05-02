import 'package:flutter/material.dart';

class RowSpaceEvenlyWidget extends StatelessWidget {
  final List<Widget> children;
  const RowSpaceEvenlyWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children
          .map(
            (e) => e is SizedBox ? e : Expanded(child: e),
          )
          .toList(),
    );
  }
}
