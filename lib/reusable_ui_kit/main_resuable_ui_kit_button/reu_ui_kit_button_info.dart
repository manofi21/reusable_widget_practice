import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_button.dart';

class ReuUiKitButtonInfo extends StatelessWidget {
  final String? textLabel;
  final void Function()? onPressed;
  final Size? sizeButton;
  final double? fontSize;
  const ReuUiKitButtonInfo({
    super.key,
    this.textLabel,
    this.onPressed,
    this.sizeButton,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitButton(
      textLabel: textLabel ?? "Info",
      fontSize: fontSize,
      color: Colors.blue,
      onPressed: onPressed,
      textColor: Colors.white,
      height: sizeButton?.height,
      width: sizeButton?.width,
    );
  }
}