import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_danger.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_warning.dart';

import '../enum/outlined_button_enum.dart';
import '../reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_disable.dart';
import '../reusable_ui_kit/main_resuable_ui_kit_outline_button/reu_ui_kit_outlined_button_success.dart';

Widget getOutlinedButton({
  required OutlinedButtonEnum outlinedType,
  required void Function() onPressed,
  String? buttonTitle,
}) {
  switch (outlinedType) {
    case OutlinedButtonEnum.danger:
      return ReuUiKitOutlinedButtonDanger(
        textLabel: buttonTitle,
        onPressed: onPressed,
      );

    case OutlinedButtonEnum.disable:
      return ReuUiKitOutlinedButtonDisable(
        textLabel: buttonTitle,
        onPressed: onPressed,
      );

    case OutlinedButtonEnum.success:
      return ReuUiKitOutlinedButtonSuccess(
        textLabel: buttonTitle,
        onPressed: onPressed,
      );

    case OutlinedButtonEnum.warning:
      return ReuUiKitOutlinedButtonWarning(
        textLabel: buttonTitle,
        onPressed: onPressed,
      );
    default:
      return Container();
  }
}
