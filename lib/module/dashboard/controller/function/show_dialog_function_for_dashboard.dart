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
    titleDialog:
        "Field Untuk anda mengimput Image yang sesuai dengan role atau kosmetik yang anda pilih. Bisa Image tentang armor,senjata, atau referensi lainnya",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoFormRadioButtonDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog:
        "Form untuk anda memilih Roles yang sesuai dengan anda. Anda juga bisa menginput role anda sendiri dengan mensubmit text box yang sudah anda ketikan",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoFormCheckboxButtonDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog:
        "Form untuk anda memilih Kosmetik yang sesuai dengan anda seperti contohnya jenis rambut."
        " Anda bisa mengimput rolenya sendiri dengan mensubmit text box yang sudah anda ketikan",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoDropdownDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog: "Form Untuk anda menginput hobi/preferesi",
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
    titleDialog: "Field untuk anda mengimput\nnama terakhir karaktermu",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> infoPhoneNumberDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog:
        "Field untuk anda menginput nomor\ntelfon mu.Untuk berjaga - jaga\nanda perlu dihubungi",
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

Future<void> infoExistingCharacterFieldDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog:
        "Field untuk anda mencari character anda yang sudah anda buat. Anda hanya perlu mengetikan nama "
        "character anda sebelumnya. Jika ada pilihan yang sesuai dengan anda muncul, anda bisa memilih nya.",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}

Future<void> onInfoCheckboxExisitngCharacterDialog(BuildContext context) async {
  return reuUiKitDialog(
    context: context,
    titleDialog:
        "Checkbox mengganti field Name sesuai kebutuhan. Jika anda mencentang checkbox ini, "
        "maka field name yang akan muncul adalah 'Your Existing Character'. Jika tidak, maka yang akan muncul "
        "adalah field 'First Name' dan 'Last Name'",
    onPressed: () {
      Navigator.pop(context);
    },
    outlinedType: OutlinedButtonEnum.info,
  );
}
