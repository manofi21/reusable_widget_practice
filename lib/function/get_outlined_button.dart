import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_danger.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_info.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_warning.dart';

import '../enum/outlined_button_enum.dart';
import '../reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_disable.dart';
import '../reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_success.dart';

Widget getOutlinedButton({
  required OutlinedButtonEnum outlinedType,
  required void Function() onPressed,
  String? buttonTitle,
}) {
  const sizedBox = Size(120, 45);
  switch (outlinedType) {
    case OutlinedButtonEnum.danger:
      return ReuUiKitOutlinedButtonDanger(
        fontSize: 20,
        textLabel: buttonTitle,
        onPressed: onPressed,
        sizeButton: sizedBox,
      );

    case OutlinedButtonEnum.disable:
      return ReuUiKitOutlinedButtonDisable(
        fontSize: 20,
        textLabel: buttonTitle,
        onPressed: onPressed,
        sizeButton: sizedBox,
      );

    case OutlinedButtonEnum.success:
      return ReuUiKitOutlinedButtonSuccess(
        fontSize: 20,
        textLabel: buttonTitle,
        onPressed: onPressed,
        sizeButton: sizedBox,
      );

    case OutlinedButtonEnum.warning:
      return ReuUiKitOutlinedButtonWarning(
        fontSize: 20,
        textLabel: buttonTitle,
        onPressed: onPressed,
        sizeButton: sizedBox,
      );

    case OutlinedButtonEnum.info:
      return ReuUiKitOutlinedButtonInfo(
        fontSize: 20,
        textLabel: buttonTitle,
        onPressed: onPressed,
        sizeButton: sizedBox,
      );
    default:
      return Container();
  }
}
