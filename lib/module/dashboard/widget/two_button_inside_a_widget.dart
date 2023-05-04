import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TwoButtonInsideAWidget extends StatefulWidget {
  final bool isSaved;
  final Widget firstWidget;
  final Widget secondWidget;
  const TwoButtonInsideAWidget({
    super.key,
    required this.isSaved,
    required this.firstWidget,
    required this.secondWidget,
  });

  @override
  State<TwoButtonInsideAWidget> createState() => _TwoButtonInsideAWidgetState();
}

class _TwoButtonInsideAWidgetState extends State<TwoButtonInsideAWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.linear,
      switchOutCurve: Curves.linear,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: !(widget.isSaved) ? widget.firstWidget : widget.secondWidget,
    );
  }
}
