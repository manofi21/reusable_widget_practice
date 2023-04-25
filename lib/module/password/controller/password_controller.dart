import 'package:flutter/material.dart';
import 'package:form_tutorial/module/password/model/password_state.dart';
import 'package:form_tutorial/state_util.dart';
import '../view/reu_ui_kit_text_field_password.dart';

class ReuUiKitTextFieldPasswordController
    extends State<ReuUiKitTextFieldPassword> implements MvcController {
  static late ReuUiKitTextFieldPasswordController instance;
  late ReuUiKitTextFieldPassword view;

  StatusPassword statusPassword = StatusPassword.init;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void onChangePassword(String value) {
    final currentStatus = passwordValidation(value);
    setState(() {
      statusPassword = currentStatus;
    });
  }
}

StatusPassword passwordValidation(String value) {
  int index = 0;
  if (value.length > 6) {
    index++;
  }

  if (value.contains(RegExp('[A-Z]{1,}'))) {
    index++;
  }

  if (value.contains(RegExp('[0-9]{1,}'))) {
    index++;
  }

  switch (index) {
    case 0:
    case 1:
      return StatusPassword.bad;
    case 2:
      return StatusPassword.average;
    case 3:
      return StatusPassword.good;
    default:
      return StatusPassword.init;
  }
}
