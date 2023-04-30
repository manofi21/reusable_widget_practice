import 'package:flutter/material.dart';
import 'package:form_tutorial/core.dart';
import '../controller/image_picker_field_controller.dart';

class ImagePickerFieldView extends StatefulWidget {
  const ImagePickerFieldView({Key? key}) : super(key: key);

  Widget build(context, ImagePickerFieldController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePickerField"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ImagePickerFieldView> createState() => ImagePickerFieldController();
}