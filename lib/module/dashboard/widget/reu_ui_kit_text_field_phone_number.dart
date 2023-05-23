import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_info.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_numeric.dart';

Widget get prefixRegionINDOCall => Container(
      margin: const EdgeInsets.only(left: 15, top: 16.5),
      child: const Text('+62', style: TextStyle(fontSize: 15)),
    );

class ReuUiKitTextFieldPhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  final Widget? sidesLabelWidget;
  const ReuUiKitTextFieldPhoneNumber({
    super.key,
    required this.controller,
    this.sidesLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextFieldNumeric(
      labelText: "Phone Number",
      controller: controller,
      prefixWidget: prefixRegionINDOCall,
      sidesLabelWidget: sidesLabelWidget,
      useShadowBox: true,
      contentPadding: const EdgeInsets.only(top: 16.5),
    );
  }
}
