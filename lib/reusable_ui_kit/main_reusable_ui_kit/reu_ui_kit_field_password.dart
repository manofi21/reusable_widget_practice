import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

import '../input_decoration_bold_shadow.dart';

class ReuUiKitFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? counter;
  final bool showPassword;
  final String labelPasswordField;
  final Widget? suffixWidget;
  final void Function()? defaultOnChange;
  final bool useShadowBox;
  final Widget? sidesLabelWidget;
  const ReuUiKitFieldPassword({
    super.key,
    required this.controller,
    this.onChanged,
    this.counter,
    this.showPassword = false,
    this.labelPasswordField = "",
    this.suffixWidget,
    this.defaultOnChange,
    this.useShadowBox = false,
    this.sidesLabelWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (useShadowBox) {
      return InputDecorationBoldShabow(
        sidesLabelWidget: sidesLabelWidget,
        labelText: labelPasswordField,
        child: ReuUiKitTextField(
          controller: controller,
          obscure: !showPassword,
          counter: counter,
          onChanged: onChanged,
          useSuffix: true,
          contentPadding: const EdgeInsets.only(top: 15),
          cursorHeight: 25,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixWidget: suffixWidget ??
              IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black.withOpacity(.5),
                ),
                onPressed: defaultOnChange,
              ),
        ),
      );
    }
    return ReuUiKitTextField(
      controller: controller,
      obscure: !showPassword,
      counter: counter,
      onChanged: onChanged,
      useSuffix: true,
      contentPadding: const EdgeInsets.only(top: 13),
      suffixWidget: suffixWidget ??
          IconButton(
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: defaultOnChange,
          ),
    );
  }
}
/*
      RichText(
        text: TextSpan(
          text: !stateController.statusPassword.isInit ? "STATUS : " : "",
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: stateController.statusPassword.toUpperCase(),
              style: TextStyle(
                color: stateController.statusPassword.getColor,
              ),
            )
          ],
        ),
      ),
*/