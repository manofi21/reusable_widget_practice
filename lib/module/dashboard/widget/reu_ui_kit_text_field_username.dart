import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

enum FieldNameType {
  firstName,
  lastName,
}

class ReuUiKitTextFieldName extends StatelessWidget {
  final TextEditingController controller;
  final FieldNameType fieldNameType;
  const ReuUiKitTextFieldName({
    super.key,
    required this.controller,
    required this.fieldNameType,
  });

  @override
  Widget build(BuildContext context) {
    final isFirstName = fieldNameType == FieldNameType.firstName;
    return ReuUiKitTextField(
      labelText: isFirstName ? "First Name" : "Last Name",
      controller: controller,
      validator:  (value) {
        if ((value?.isEmpty ?? true) && isFirstName) {
          return 'First name is cannot be empty';
        }
        return null;
      },
    );
  }
}
