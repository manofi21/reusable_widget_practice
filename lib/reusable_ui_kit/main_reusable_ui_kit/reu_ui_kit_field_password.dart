import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_text_field.dart';

class ReuUiKitFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? counter;
  final bool showPassword;
  final String labelPasswordField;
  final Widget? suffixWidget;
  final void Function()? defaultOnChange;
  const ReuUiKitFieldPassword({
    super.key,
    required this.controller,
    this.onChanged,
    this.counter,
    this.showPassword = false,
    this.labelPasswordField = "",
    this.suffixWidget,
    this.defaultOnChange,
  });

  @override
  Widget build(BuildContext context) {
    return ReuUiKitTextField(
      labelText: labelPasswordField,
      controller: controller,
      obscure: !showPassword,
      counter: counter,
      onChanged: onChanged,
      suffixWidget: suffixWidget ??
          IconButton(
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
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