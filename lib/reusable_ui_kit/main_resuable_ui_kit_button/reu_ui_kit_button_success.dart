import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_button.dart';

class ReuUiKitButtonSuccess extends StatelessWidget {
  final String? textLabel;
  final void Function()? onPressed;
  const ReuUiKitButtonSuccess({
    super.key,
    this.textLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitButton(
      textLabel: textLabel ?? "Success",
      color: Colors.greenAccent,
      onPressed: onPressed,
    );
  }
}
