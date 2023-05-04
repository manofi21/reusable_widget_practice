import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_button.dart';

class ReuUiKitButtonDanger extends StatelessWidget {
  final String? textLabel;
  final void Function()? onPressed;
  const ReuUiKitButtonDanger({
    super.key,
    this.textLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitButton(
      textLabel: textLabel ?? "Danger",
      color: Colors.red,
      onPressed: onPressed,
    );
  }
}