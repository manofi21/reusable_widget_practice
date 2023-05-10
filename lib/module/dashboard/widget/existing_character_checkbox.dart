import 'package:flutter/material.dart';

class ExistingCharacterCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const ExistingCharacterCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        const Text("Existing Character"),
      ],
    );
  }
}
