import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_tutorial/state_util.dart';
import 'package:image_picker/image_picker.dart';
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

Future<ResultImagePicker> getFileMultiplePlatform() async {
  List<XFile> listFile = await ImagePicker().pickMultiImage();
  return ResultImagePicker(listFile);
}

class ResultImagePicker {
  final List<XFile> listNameOfXfile;

  ResultImagePicker(this.listNameOfXfile);

  String get nameOfValue {
    final getListName = listNameOfXfile.map((e) => '"${e.name}"').toList();
    final valuesOfName = getListName.join(', ');
    return valuesOfName;
  }

  Future<List<Uint8List>> get listOfUint8ListImg async {
    return Future.wait(listNameOfXfile.map((e) => e.readAsBytes()).toList());
  }
}
