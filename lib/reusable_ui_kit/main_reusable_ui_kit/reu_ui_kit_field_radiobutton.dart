import 'package:flutter/material.dart';

class ReuRadioButtonModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;

  /// The value table need equitable too.
  final T value;
  final bool isRadioChoose;

  ReuRadioButtonModel({
    this.label,
    required this.value,
    this.isRadioChoose = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
      'isRadioChoose': isRadioChoose,
    };
  }

  String get labelValue => label ?? value.toString();

  ReuRadioButtonModel<T> onChangeIsBoxChecked(bool isRadioChange) {
    return ReuRadioButtonModel<T>(
      value: value,
      isRadioChoose: isRadioChange,
      label: label,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReuRadioButtonModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value &&
          isRadioChoose == other.isRadioChoose;

  @override
  int get hashCode => label.hashCode ^ value.hashCode ^ isRadioChoose.hashCode;
}

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
