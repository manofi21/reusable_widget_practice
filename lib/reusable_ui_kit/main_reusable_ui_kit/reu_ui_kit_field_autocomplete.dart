import 'package:flutter/material.dart';

import '../base_reusable_ui_kit/reu_ui_kit_text_field.dart';
import '../entities/reu_autopopulate_model.dart';
import '../input_decoration_bold_shadow.dart';

class ReuUiKitFieldAutoComplete<T> extends StatefulWidget {
  final String label;
  final List<ReuAutopopulateModel<T>> items;

  /// Prefer use index for inital value for get value in list [items]
  final int? indexOfInitialValue;
  final void Function(ReuAutopopulateModel<T> values) onSelected;
  final bool useShadowBox;

  final Widget? sidesLabelWidget;

  const ReuUiKitFieldAutoComplete({
    super.key,
    required this.label,
    this.items = const [],
    this.indexOfInitialValue,
    required this.onSelected,
    this.sidesLabelWidget,
    this.useShadowBox = false,
  });

  @override
  State<ReuUiKitFieldAutoComplete<T>> createState() =>
      _ReuUiKitFieldAutoCompleteState<T>();
}

class _ReuUiKitFieldAutoCompleteState<T>
    extends State<ReuUiKitFieldAutoComplete<T>> {
  List<ReuAutopopulateModel<T>> items = [];
  String initialLable = '';
  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    final currIndex = widget.indexOfInitialValue;
    initialLable = currIndex != null ? items[currIndex].labelValue : '';
  }

  @override
  Widget build(BuildContext context) {
    final widgetAutopopulate = Autocomplete<ReuAutopopulateModel<T>>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return ReuUiKitTextField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (text) => onFieldSubmitted(),
          useSuffix: true,
          suffixIcon: Icons.search,
        );
      },
      initialValue: TextEditingValue(text: initialLable),
      onSelected: widget.onSelected,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return Iterable<ReuAutopopulateModel<T>>.empty();
        }

        final result = items.where(
          (e) => e.labelValue.contains(
            textEditingValue.text.toLowerCase(),
          ),
        );

        return result;
      },
    );

    if (widget.useShadowBox) {
      return InputDecorationBoldShabow(
        labelText: widget.label,
        sidesLabelWidget: widget.sidesLabelWidget,
        child: widgetAutopopulate,
      );
    }

    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.label,
        border: InputBorder.none,
      ),
      child: widgetAutopopulate,
    );
  }
}
