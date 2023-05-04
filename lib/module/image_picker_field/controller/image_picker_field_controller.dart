import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:form_tutorial/state_util.dart';
import '../../../function/get_image_to_list.dart';
import '../view/image_picker_field_view.dart';

class ImagePickerFieldController extends State<ImagePickerFieldView>
    implements MvcController {
  static late ImagePickerFieldController instance;
  late ImagePickerFieldView view;

  final imagePickerTextController = TextEditingController();

  var listMultipleImage = <Uint8List>[];

  String? imageUrl;

  bool isLoading = false;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  Future<void> onPressedImagePicker() async {
    isLoading = true;
    setState(() {
      listMultipleImage.clear();
    });
    final getImageResult = await getFileMultiplePlatform();
    listMultipleImage = await getImageResult.listOfUint8ListImg;
    imagePickerTextController.text = getImageResult.nameOfValue;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}