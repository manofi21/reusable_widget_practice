import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_rounded_field.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_areatext.dart';

class ReuUiKitTextFieldAddress extends StatelessWidget {
  final TextEditingController controller;
  const ReuUiKitTextFieldAddress({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextFieldAreaText(
      labelText: "Address",
      controller: controller,
    );
  }
}
