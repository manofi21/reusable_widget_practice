import 'package:flutter/material.dart';

import '../input_decoration_bold_shadow.dart';
import 'reu_ui_kit_text_field.dart';

class ReuUiKitTextRoundedField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final int maxLines;
  final InputBorder? border;
  final bool isOutsideField;
  const ReuUiKitTextRoundedField({
    super.key,
    required this.labelText,
    required this.controller,
    this.maxLines = 1,
    this.border,
    this.isOutsideField = true,
  });

  @override
  State<ReuUiKitTextRoundedField> createState() =>
      _ReuUiKitTextRoundedFieldState();
}

class _ReuUiKitTextRoundedFieldState extends State<ReuUiKitTextRoundedField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isOutsideField) {
      return InputDecorationBoldShabow(
        labelText: widget.labelText,
        child: ReuUiKitTextField(
          labelText: '',
          controller: widget.controller,
          border: widget.border,
          maxLines: widget.maxLines,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: ReuUiKitTextField(
        labelText: widget.labelText,
        controller: widget.controller,
        border: widget.border,
        maxLines: widget.maxLines,
      ),
    );
  }
}
