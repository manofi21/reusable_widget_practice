import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_button.dart';

class ReuUiKitButtonWarning extends StatelessWidget {
  final String? textLabel;
  final void Function()? onPressed;
  final Size? sizeButton;
  final double? fontSize;
  const ReuUiKitButtonWarning({
    super.key,
    this.textLabel,
    this.onPressed,
    this.sizeButton,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitButton(
      textLabel: textLabel ?? "Warning",
      color: Colors.yellowAccent.shade100,
      onPressed: onPressed,
      height: sizeButton?.height,
      width: sizeButton?.width,
      fontSize: fontSize,
    );
  }
}
