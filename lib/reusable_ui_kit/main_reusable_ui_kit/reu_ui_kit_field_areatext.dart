import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_rounded_field.dart';

class ReuUiKitTextFieldAreaText extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  const ReuUiKitTextFieldAreaText({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextRoundedField(
      labelText: labelText,
      controller: controller,
      maxLines: maxLines,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}
