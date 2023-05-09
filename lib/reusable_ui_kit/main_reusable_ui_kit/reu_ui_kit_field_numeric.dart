import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

import '../input_decoration_bold_shadow.dart';

class ReuUiKitTextFieldNumeric extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? prefixWidget;
  final String? Function(String?)? validator;
  final bool useShadowBox;
  final Widget? sidesLabelWidget;
  const ReuUiKitTextFieldNumeric({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixWidget,
    this.validator,
    this.useShadowBox = false,
    this.sidesLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final fieldNumeric = ReuUiKitTextField(
      labelText: useShadowBox ? null : labelText,
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
    
    if (useShadowBox) {
      return InputDecorationBoldShabow(
        labelText: labelText,
        sidesLabelWidget: sidesLabelWidget,
        child: fieldNumeric,
      );
    }

    return fieldNumeric;
  }
}
