import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_tutorial/enum/outlined_button_enum.dart';
import 'package:form_tutorial/function/get_outlined_button.dart';

import '../container_solid_shadow_box.dart';

Future<void> reuUiKitDialog({
  required BuildContext context,
  required String titleDialog,
  String? buttonTitle,
  required FutureOr<void> Function() onPressed,
  required OutlinedButtonEnum outlinedType,
  List<Widget> otherWidget = const [],
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return ReuUiKitDialog(
        dialogRitle: titleDialog,
        onPressed: onPressed,
        buttonTitle: buttonTitle,
        outlinedType: outlinedType,
        otherWidget: otherWidget,
      );
    },
  );
}

class ReuUiKitDialog extends StatelessWidget {
  final String dialogRitle;
  final String? buttonTitle;
  final void Function() onPressed;
  final OutlinedButtonEnum outlinedType;
  final List<Widget> otherWidget;
  const ReuUiKitDialog({
    super.key,
    required this.dialogRitle,
    required this.onPressed,
    this.buttonTitle,
    required this.outlinedType,
    this.otherWidget = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ContainerSolidShadowBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.info_outline),
                  const SizedBox(width: 10),
                  Expanded(child: Text(dialogRitle))
                ],
              ),
            ),
            const SizedBox(height: 10),
            getOutlinedButton(
              outlinedType: outlinedType,
              onPressed: onPressed,
              buttonTitle: buttonTitle,
            ),
            ...otherWidget,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
