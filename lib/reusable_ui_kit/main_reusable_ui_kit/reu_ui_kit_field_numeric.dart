import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

class ReuUiKitTextFieldNumeric extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? prefixWidget;
  final String? Function(String?)? validator;
  const ReuUiKitTextFieldNumeric({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixWidget,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextField(
      labelText: labelText,
      controller: controller,
      usePrefix: prefixWidget != null,
      prefixWidget: prefixWidget,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Phone Number Must be Filled";
        }

        if (int.tryParse(value ?? '') == null) {
          return "Phone Number Must Be Numeric";
        }
        
        final currValidator = validator;
        if (currValidator != null) {
          return currValidator(value);
        }

        return null;
      },
    );
  }
}
