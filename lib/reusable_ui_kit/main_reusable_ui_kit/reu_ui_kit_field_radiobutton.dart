import 'package:flutter/material.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_radiobutton_model.dart';

class ReuUiKitFieldRadiobutton<T> extends StatefulWidget {
  final String label;
  final List<ReuRadioButtonModel<T>> items;

  /// Prefer use index for inital value for get value in list [items]
  final int? indexOfInitialValue;
  final String? Function(List<ReuRadioButtonModel<T>> item)? validator;
  final void Function(ReuRadioButtonModel<T>? values) onChanged;

  const ReuUiKitFieldRadiobutton({
    super.key,
    this.validator,
    this.indexOfInitialValue,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  State<ReuUiKitFieldRadiobutton<T>> createState() =>
      _ReuUiKitFieldRadiobuttonState<T>();
}

class _ReuUiKitFieldRadiobuttonState<T>
    extends State<ReuUiKitFieldRadiobutton<T>> {
  List<ReuRadioButtonModel<T>> items = [];
  ReuRadioButtonModel<T>? selectedValue;

  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    final indexOfRadio = widget.indexOfInitialValue;
    assert(indexOfRadio == null || indexOfRadio < widget.items.length - 1);
    selectedValue = indexOfRadio != null ? items[indexOfRadio] : null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      enabled: true,
      validator: (value) => widget.validator!(items),
      builder: (FormFieldState<bool> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            border: InputBorder.none,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];

              return RadioListTile<ReuRadioButtonModel<T>>(
                title: Text(item.labelValue),
                groupValue: selectedValue,
                selected: item.isRadioChoose,
                value: item,
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
          ),
        );
      },
    );
  }
}
