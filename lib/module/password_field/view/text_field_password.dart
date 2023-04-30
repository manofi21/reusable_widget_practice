import 'package:flutter/material.dart';
import 'package:form_tutorial/module/password_field/controller/password_controller.dart';
import 'package:form_tutorial/module/password_field/model/password_state.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_password.dart';

class ReuUiKitTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  const ReuUiKitTextFieldPassword({
    super.key,
    required this.controller,
  });

  Widget build(context, ReuUiKitTextFieldPasswordController stateController) {
    stateController.view = this;

    return ReuUiKitFieldPassword(
      labelPasswordField: "Password",
      controller: controller,
      showPassword: stateController.onShowPassword,
      defaultOnChange: stateController.onChangeShowPassword,
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
