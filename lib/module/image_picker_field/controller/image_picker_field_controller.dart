import 'package:flutter/material.dart';
import 'package:form_tutorial/state_util.dart';
import '../view/image_picker_field_view.dart';

class ImagePickerFieldController extends State<ImagePickerFieldView> implements MvcController {
  static late ImagePickerFieldController instance;
  late ImagePickerFieldView view;

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