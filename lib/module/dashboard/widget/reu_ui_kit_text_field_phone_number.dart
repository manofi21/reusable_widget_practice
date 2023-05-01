import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

Widget get prefixRegionINDOCall => Container(
      margin: const EdgeInsets.only(left: 15, top: 16.5),
      child: const Text('+62', style: TextStyle(fontSize: 15)),
    );

class ReuUiKitTextFieldPhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  const ReuUiKitTextFieldPhoneNumber({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextField(
      labelText: 'Phone Number',
      controller: controller,
      usePrefix: true,
      prefixWidget: prefixRegionINDOCall,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Phone Number Must be Filled";
        }

        if (int.tryParse(value ?? '') == null) {
          return "Phone Number Must Be Numeric";
        }

        return null;
      },
    );
  }
}
