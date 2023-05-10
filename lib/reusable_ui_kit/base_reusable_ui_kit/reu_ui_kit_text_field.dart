import 'package:flutter/material.dart';

class ReuUiKitTextField extends StatefulWidget {
  final String? id;
  final String? labelText;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final bool usePrefix;
  final Widget? suffixWidget;
  final IconData? suffixIcon;
  final bool useSuffix;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? counter;
  final bool defaultCounter;
  final InputBorder? border;
  final int maxLines;
  final TextInputType textInputType;
  final bool useBorder;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final FocusNode? focusNode;

  const ReuUiKitTextField({
    Key? key,
    this.labelText,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixWidget,
    this.prefixIcon,
    this.usePrefix = false,
    this.suffixWidget,
    this.suffixIcon,
    this.useSuffix = false,
    required this.controller,
    this.defaultCounter = false,
    this.border,
    this.counter,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.useBorder = true,
    this.contentPadding = EdgeInsets.zero,
    this.cursorHeight, 
    this.focusNode,
  }) : super(key: key);

  @override
  State<ReuUiKitTextField> createState() => _ReuUiKitTextFieldState();
}

class _ReuUiKitTextFieldState extends State<ReuUiKitTextField> {
  @override
  void initState() {
    widget.controller.text = widget.value ?? "";
    super.initState();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: widget.focusNode ?? focusNode,
      validator: widget.validator,
      maxLength: widget.maxLength,
      obscureText: widget.obscure,
      maxLines: widget.maxLines,
      keyboardType: widget.textInputType,
      cursorHeight: widget.cursorHeight,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: widget.labelText,
        contentPadding: widget.contentPadding,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        border: widget.useBorder ? widget.border : InputBorder.none,
        focusedBorder: widget.border,
        counter: widget.counter == null && !widget.defaultCounter
            ? Container()
            : widget.counter,
        enabledBorder: widget.border ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
        prefixIcon: widget.usePrefix
            ? widget.prefixWidget ??
                Icon(widget.prefixIcon ?? Icons.text_format)
            : null,
        suffixIcon: widget.useSuffix
            ? widget.suffixWidget ??
                Icon(widget.suffixIcon ?? Icons.text_format)
            : null,
        helperText: widget.hint,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: (value) {
        if (widget.onSubmitted != null) widget.onSubmitted!(value);
      },
    );
  }
}
