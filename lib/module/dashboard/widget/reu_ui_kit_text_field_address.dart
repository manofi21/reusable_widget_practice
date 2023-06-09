import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_areatext.dart';

class ReuUiKitTextFieldAddress extends StatelessWidget {
  final TextEditingController controller;
  final Widget? sidesLabelWidget;
  const ReuUiKitTextFieldAddress(
      {super.key, required this.controller, this.sidesLabelWidget});

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextFieldAreaText(
      labelText: "Address",
      controller: controller,
      useShadowBox: true,
      sidesLabelWidget: sidesLabelWidget,
    );
  }
}
