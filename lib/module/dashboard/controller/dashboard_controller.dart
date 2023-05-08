import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_tutorial/state_util.dart';
import '../../../function/get_image_to_list.dart';
import '../view/dashboard_view.dart';
import 'function/show_dialog_function_for_dashboard.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  var _isAlreadySaved = false;
  bool get isAlreadySave => _isAlreadySaved;
  set isAlreadySave(bool isSaved) {
    _isAlreadySaved = isSaved;
    setState(() {});
  }

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  final fistNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final addressController = TextEditingController();

  final imagePickerTextController = TextEditingController();

  List<Uint8List> listImg = <Uint8List>[];

  Future<void> onPressedImagePicker() async {
    isLoading = true;
    final getImageResult = await getFileMultiplePlatform();
    listImg = await getImageResult.listOfUint8ListImg;
    imagePickerTextController.text = getImageResult.nameOfValue;
    isLoading = false;
    setState(() {});
  }

  void clearListImg() {
    listImg.clear();
    imagePickerTextController.clear();
    setState(() {});
  }

  void onRemoveDataFunction() {
    removeDataDialog(
      context,
      nSaveFuncion: () {
        _isAlreadySaved = false;
        setState(() {});
      },
    );
  }

  void onClearImageDialog() {
    clearImageDialog(
      context,
      nSaveFuncion: () {
        clearListImg();
      },
    );
  }

  Future<void> onSuccessSaveDialog() async {
    await successSaveDialog(context);
    _isAlreadySaved = false;
    setState(() {});
  }

  void onDisabledClearButtonDialog() {
    disabledClearButtonDialog(context);
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}