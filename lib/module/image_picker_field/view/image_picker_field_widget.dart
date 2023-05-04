import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_image_picker.dart';
import '../widget/stagged_grid_view_widget.dart';

class ImagePickerFieldWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final List<Widget> footWidget;

  final TextEditingController imagePickerTextController;
  final bool isLoading;
  final FutureOr<void> Function()? onPressed;
  final List<Uint8List> listMultipleImage;

  const ImagePickerFieldWidget({
    super.key,
    this.validator,
    this.labelText = "",
    this.footWidget = const [],
    this.onPressed,
    required this.imagePickerTextController,
    required this.isLoading,
    required this.listMultipleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ReuUiKitFieldImagePicker(
          textController: imagePickerTextController,
          labelText: labelText,
          onFieldChanged: (p0) {},
          isLoading: isLoading,
          onPressed: onPressed,
        ),
        const SizedBox(height: 10),
        MyStaggeredGridview(
          listUint8List: listMultipleImage,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: footWidget,
        )
      ],
    );
  }
}
