import 'package:flutter/material.dart';

class ExistingCharacterCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final Widget? sidesLabelWidget;
  const ExistingCharacterCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.sidesLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        const Text("Existing Character"),
        sidesLabelWidget ?? Container(),
      ],
    );
  }
}
