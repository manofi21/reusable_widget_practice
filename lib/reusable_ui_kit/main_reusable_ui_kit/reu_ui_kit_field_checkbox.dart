import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_checkbox_model.dart';

import '../input_decoration_bold_shadow.dart';

final otherFieldFocuseNode = FocusNode();
final textEditingFieldController = TextEditingController();

class ReuUiKitFieldCheckbox<T> extends StatefulWidget {
  final String label;
  final String? hint;
  final List<ReuCheckboxModel<T>> items;
  final String? Function(List<ReuCheckboxModel<T>> item)? validator;
  final Future<List<ReuCheckboxModel<T>>> Function()? onFuture;
  final void Function(List<ReuCheckboxModel<T>> values) onChanged;
  final ScrollPhysics? physics;
  final bool useShadowBox;

  /// Param for intial other. Add this for allow user can input their options
  final ReuCheckboxModel<T>? initialOther;

  final Widget? sidesLabelWidget;

  final bool isUseCheckAll;

  const ReuUiKitFieldCheckbox({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.onFuture,
    this.hint,
    required this.onChanged,
    this.physics,
    this.useShadowBox = false,
    this.initialOther,
    this.sidesLabelWidget,
    this.isUseCheckAll = true,
  }) : super(key: key);

  @override
  State<ReuUiKitFieldCheckbox<T>> createState() =>
      _ReuUiKitFieldCheckboxState<T>();
}

class _ReuUiKitFieldCheckboxState<T> extends State<ReuUiKitFieldCheckbox<T>> {
  List<ReuCheckboxModel<T>> items = [];
  bool isUserAllowCustomInput = false;
  bool isCheckAllCheced = false;

  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    isUserAllowCustomInput = widget.initialOther != null;
    loadItems();
  }

  loadItems() async {
    if (widget.onFuture == null) return;

    List<ReuCheckboxModel<T>> newItems = await widget.onFuture!();
    items = newItems;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      validator: (value) => widget.validator!(items),
      enabled: true,
      builder: (FormFieldState<bool> field) {
        final listOfCheckbox = ListView.builder(
          shrinkWrap: true,
          itemCount: isUserAllowCustomInput ? items.length + 1 : items.length,
          physics: widget.physics ?? const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == items.length && isUserAllowCustomInput) {
              return CheckboxListTile(
                title: TextField(
                  textCapitalization: TextCapitalization.words,
                  focusNode: otherFieldFocuseNode,
                  controller: textEditingFieldController,
                  onSubmitted: (value) {
                    final newValueFromUser = widget.initialOther!
                        .onUserInsertNewValue(userInput: value);
                    setState(() {
                      textEditingFieldController.clear();
                      items.add(newValueFromUser);
                    });
                  },
                ),
                value: otherFieldFocuseNode.hasFocus,
                onChanged: (val) {
                  if (val != null && items.length > index) {
                    setState(() {
                      items[index] = items[index].onChangeIsBoxChecked(val);
                      field.didChange(true);
                    });
                    widget.onChanged(items);
                  }
                },
              );
            }

            return CheckboxListTile(
              title: Text(items[index].labelValue),
              value: items[index].isBoxChecked,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    items[index] = items[index].onChangeIsBoxChecked(val);
                    textEditingFieldController.clear();
                    otherFieldFocuseNode.unfocus();
                    field.didChange(true);
                  });
                  widget.onChanged(items);
                }
              },
            );
          },
        );

        if (widget.useShadowBox) {
          return InputDecorationBoldShabow(
            labelText: widget.label,
            sidesLabelWidget: widget.sidesLabelWidget,
            child: widget.isUseCheckAll
                ? Column(
                    children: [
                      CheckboxListTile(
                        title: const Text("Check All"),
                        value: isCheckAllCheced,
                        onChanged: (val) {
                          for (var i = 0; i < items.length;i++) {
                            items[i] = items[i].onChangeIsBoxChecked(val ?? false);
                          }
                          isCheckAllCheced = val ?? false;
                          field.didChange(true);
                        },
                      ),
                      listOfCheckbox,
                    ],
                  )
                : listOfCheckbox,
          );
        }

        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            border: InputBorder.none,
            helperText: widget.hint,
          ),
          child: widget.isUseCheckAll
              ? Column(
                  children: [
                    CheckboxListTile(
                      title: const Text("Check All"),
                      value: false,
                      onChanged: (val) {
                        // if (val != null) {
                        //   setState(() {
                        //     items[index] =
                        //         items[index].onChangeIsBoxChecked(val);
                        //     textEditingFieldController.clear();
                        //     otherFieldFocuseNode.unfocus();
                        //     field.didChange(true);
                        //   });
                        //   widget.onChanged(items);
                        // }
                      },
                    ),
                    listOfCheckbox,
                  ],
                )
              : listOfCheckbox,
        );
      },
    );
  }
}
