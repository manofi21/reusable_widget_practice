import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_outlined_button.dart';

class ReuUiKitOutlinedButtonDanger extends StatelessWidget {
  final String? textLabel;
  final void Function()? onPressed;
  final Size? sizeButton;
  final double? fontSize;
  const ReuUiKitOutlinedButtonDanger({
    super.key,
    this.textLabel,
    this.onPressed,
    this.sizeButton,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitOutlinedButton(
      textLabel: textLabel ?? "Danger",
      color: Colors.red,
      onPressed: onPressed,
      height: sizeButton?.height,
      width: sizeButton?.width,
      fontSize: fontSize,
    );
  }
}
