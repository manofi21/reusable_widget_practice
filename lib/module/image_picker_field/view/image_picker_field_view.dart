import 'package:flutter/material.dart';
import 'package:form_tutorial/core.dart';
import 'package:form_tutorial/module/image_picker_field/widget/stagged_grid_view_widget.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_image_picker.dart';
import '../controller/image_picker_field_controller.dart';

class ImagePickerFieldView extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final String labelText;
  final List<Widget> footWidget;
  const ImagePickerFieldView({
    Key? key,
    this.validator,
    required this.onChanged,
    this.labelText = "",
    this.footWidget = const [],
  }) : super(key: key);

  Widget build(context, ImagePickerFieldController controller) {
    controller.view = this;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ReuUiKitFieldImagePicker(
          textController: controller.imagePickerTextController,
          labelText: labelText,
          onFieldChanged: (p0) {},
          isLoading: controller.isLoading,
          onPressed: () async {
            await controller.onPressedImagePicker();
          },
        ),
        const SizedBox(height: 10),
        MyStaggeredGridview(
          listUint8List: controller.listMultipleImage,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: footWidget,
        )
      ],
    );
  }

  @override
  State<ImagePickerFieldView> createState() => ImagePickerFieldController();
}
