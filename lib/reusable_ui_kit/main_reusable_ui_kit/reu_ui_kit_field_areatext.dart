import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/input_decoration_bold_shadow.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_field.dart';

class ReuUiKitTextFieldAreaText extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final bool useShadowBox;
  final InputBorder? border;

  final Widget? sidesLabelWidget;

  const ReuUiKitTextFieldAreaText({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 3,
    this.useShadowBox = false,
    this.border,
    this.sidesLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final keyboardType =
        maxLines > 1 ? TextInputType.multiline : TextInputType.text;
    if (useShadowBox) {
      return InputDecorationBoldShabow(
        labelText: labelText,
        sidesLabelWidget: sidesLabelWidget,
        child: ReuUiKitTextField(
          controller: controller,
          maxLines: maxLines,
          textInputType: keyboardType,
          border: border,
        ),
      );
    }

    return ReuUiKitTextField(
      labelText: labelText,
      controller: controller,
      maxLines: maxLines,
      textInputType: keyboardType,
    );
  }
}
