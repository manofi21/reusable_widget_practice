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

Future<void> disabledClearButtonDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "List Image Kosong. "
        "Button Terdisable",
    buttonTitle: "Close",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.disable,
  );
}

Future<void> infoImagePickerDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Untuk memilih Image yang sesuai\ndengan role. Bisa Image tentang armor,\nsenjata, atau referensi lainnya",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoFormRadioButtonDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Untuk memilih Roles yang user inginkan. User\n juga bisa mengimput rolenya sendiri dengan mensubmit\ntext box yang mereka sudah ketik",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoFormCheckboxButtonDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Untuk memilih Kosmetik yang user inginkan seperti\ncontohnya jenis rambut.\nUser juga bisa mengimput rolenya sendiri dengan mensubmit\ntext box yang mereka sudah ketik",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoDropdownDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Untuk hobi/preferesi yang inginkan user",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoFirstCharacterNameDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Field untuk anda mengimput nama pertama karaktermu",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoLastCharacterNameDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Field untuk anda mengimput nama terakhir karaktermu",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoPhoneNumberDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Field untuk anda menginput nomor telfon mu.\nUntuk berjaga - jaga anda perlu dihubungi",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoEmailDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Field untuk anda menginput E-mail.",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoPassEmailDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Field untuk anda menginput Password E-mail.",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}