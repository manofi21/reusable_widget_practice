
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../enum/outlined_button_enum.dart';
import '../../../../function/get_outlined_button.dart';
import '../../../../reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_dialog.dart';

Future<void> removeDataDialog(
  BuildContext context, {
  required FutureOr<void> Function() nSaveFuncion,
}) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Data akan terhapus sampai bersih.\n Ingin melanjutkan?",
    buttonTitle: "Hapus",
    onPressed: () async {
      await nSaveFuncion();

      // ignore: use_build_context_synchronously
      if (!context.mounted) return;
      Navigator.pop(context);
    },
    otherWidget: [
      const SizedBox(height: 10),
      getOutlinedButton(
        buttonTitle: "Jangan",
        outlinedType: OutlinedButtonEnum.disable,
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
    outlinedType: OutlinedButtonEnum.danger,
  );
}

Future<void> successSaveDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Data berhasil di simpan",
    buttonTitle: "OK",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.success,
  );
}

Future<void> clearImageDialog(
  BuildContext context, {
  required FutureOr<void> Function() nSaveFuncion,
}) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Apakah anda yakin ingin menghapus\n semua gambar?",
    buttonTitle: "Yes",
    onPressed: () async {
      await nSaveFuncion();

      // ignore: use_build_context_synchronously
      if (!context.mounted) return;
      Navigator.pop(context);
    },
    otherWidget: [
      const SizedBox(height: 10),
      getOutlinedButton(
        buttonTitle: "No",
        outlinedType: OutlinedButtonEnum.disable,
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
    outlinedType: OutlinedButtonEnum.warning,
  );
}
