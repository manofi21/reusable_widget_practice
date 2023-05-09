import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_radiobutton_model.dart';

import '../input_decoration_bold_shadow.dart';

final otherFieldFocuseNode = FocusNode();
final textEditingFieldController = TextEditingController();

class ReuUiKitFieldRadiobutton<T> extends StatefulWidget {
  final String label;
  final List<ReuRadioButtonModel<T>> items;

  /// Prefer use index for inital value for get value in list [items]
  final int? indexOfInitialValue;
  final String? Function(List<ReuRadioButtonModel<T>> item)? validator;
  final void Function(ReuRadioButtonModel<T>? values) onChanged;
  final ScrollPhysics? physics;
  final bool useShadowBox;

  /// Param for intial other. Add this for allow user can input their options 
  final ReuRadioButtonModel<T>? initialOther;

  const ReuUiKitFieldRadiobutton({
    super.key,
    this.validator,
    this.indexOfInitialValue,
    required this.label,
    required this.items,
    required this.onChanged,
    this.initialOther,
    this.physics,
    this.useShadowBox = false,
  });

  @override
  State<ReuUiKitFieldRadiobutton<T>> createState() =>
      _ReuUiKitFieldRadiobuttonState<T>();
}

class _ReuUiKitFieldRadiobuttonState<T>
    extends State<ReuUiKitFieldRadiobutton<T>> {
  List<ReuRadioButtonModel<T>> items = [];
  ReuRadioButtonModel<T>? selectedValue;
  bool isUserAllowCustomInput = false;

  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    final indexOfRadio = widget.indexOfInitialValue;
    assert(indexOfRadio == null || indexOfRadio < widget.items.length - 1);
    selectedValue = indexOfRadio != null ? items[indexOfRadio] : null;
    isUserAllowCustomInput = widget.initialOther != null;
    otherFieldFocuseNode.addListener(() {
      if (otherFieldFocuseNode.hasFocus) {
        setState(() {
          selectedValue = widget.initialOther;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      enabled: true,
      validator: (value) => widget.validator!(items),
      builder: (FormFieldState<bool> field) {
        final listOfRadioButton = ListView.builder(
          shrinkWrap: true,
          itemCount: isUserAllowCustomInput ? items.length + 1 : items.length,
          physics: widget.physics ?? const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == items.length && isUserAllowCustomInput) {
              return RadioListTile<ReuRadioButtonModel<T>>(
                value: widget.initialOther!,
                groupValue: selectedValue,
                title: TextField(
                  textCapitalization: TextCapitalization.words,
                  focusNode: otherFieldFocuseNode,
                  controller: textEditingFieldController,
                  onChanged: (_) {
                    if (selectedValue != widget.initialOther) {
                      selectedValue = widget.initialOther;
                    }
                  },
                  onSubmitted: (value) {
                    final newValueFromUser = widget.initialOther!
                        .onUserInsesrtNewValue(userInput: value);
                    setState(() {
                      textEditingFieldController.clear();
                      items.add(newValueFromUser);
                      selectedValue = newValueFromUser;
                    });
                  },
                ),
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      selectedValue = val;
                      field.didChange(true);
                      widget.onChanged(val);
                    });
                  }
                },
                onFocusChange: (val) {
                  setState(
                    () {
                      setState(() {});
                      field.didChange(true);
                    },
                  );
                },
              );
            }

            var item = items[index];
            return RadioListTile<ReuRadioButtonModel<T>>(
              title: Text(item.labelValue,
                  style: const TextStyle(color: Colors.black)),
              groupValue: selectedValue,
              selected: item.isRadioChoose,
              value: item,
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selectedValue = val;
                    textEditingFieldController.clear();
                    otherFieldFocuseNode.unfocus();
                    field.didChange(true);
                    widget.onChanged(val);
                  });
                }
              },
              onFocusChange: (val) {
                setState(
                  () {
                    setState(() {
                      items[index] = items[index].onChangeIsBoxChecked(
                        val,
                      );
                    });
                    field.didChange(true);
                  },
                );
              },
            );
          },
        );

        if (widget.useShadowBox) {
          return InputDecorationBoldShabow(
            labelText: widget.label,
            child: listOfRadioButton,
          );
        }

        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            border: InputBorder.none,
          ),
          child: listOfRadioButton,
        );
      },
    );
  }
}
