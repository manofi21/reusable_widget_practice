import 'package:flutter/material.dart';
import 'package:form_tutorial/core.dart';
import 'package:form_tutorial/reusable_ui_kit/reu_ui_kit_text_field.dart';
import '../controller/password_controller.dart';

class ReuUiKitTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  const ReuUiKitTextFieldPassword({
    super.key,
    required this.controller,
  });

  Widget build(context, ReuUiKitTextFieldPasswordController stateController) {
    stateController.view = this;

    return ReuUiKitTextField(
      labelText: "Password",
      controller: controller,
      obscure: true,
      counter: RichText(
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
      onChanged: stateController.onChangePassword,
    );
  }

  @override
  State<ReuUiKitTextFieldPassword> createState() =>
      ReuUiKitTextFieldPasswordController();
}
