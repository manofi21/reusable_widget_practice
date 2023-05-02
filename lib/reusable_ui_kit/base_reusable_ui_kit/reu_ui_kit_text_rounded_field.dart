import 'package:flutter/material.dart';

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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.labelText),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurStyle: BlurStyle.solid,
                  blurRadius: 1,
                  offset: Offset(0, 5)
                )
              ]
            ),
            child: ReuUiKitTextField(
              labelText: '',
              controller: widget.controller,
              border: widget.border,
              maxLines: widget.maxLines,
            ),
          ),
        ],
      );
    }
    
    return Container(
      padding: const EdgeInsets.all(5),
      // constraints: const BoxConstraints.tightFor(width: 47, height: 47),
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
