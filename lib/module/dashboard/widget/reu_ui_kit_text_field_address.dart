import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_rounded_field.dart';

class ReuUiKitTextFieldAddress extends StatelessWidget {
  final TextEditingController controller;
  const ReuUiKitTextFieldAddress({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextRoundedField(
      // isOutsideField: false,
      labelText: "Address",
      controller: controller,
      maxLines: 3,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}