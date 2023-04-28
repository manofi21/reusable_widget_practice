import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReuChecboxModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;
  final T value;
  final bool isBoxChecked;

  ReuChecboxModel({this.label, required this.value, this.isBoxChecked = false});

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
      'isBoxChecked': isBoxChecked,
    };
  }

  String get labelValue => label ?? value.toString();

  ReuChecboxModel<T> onChangeIsBoxChecked(bool isBoxChanged) {
    return ReuChecboxModel<T>(
      value: value,
      isBoxChecked: isBoxChecked,
      label: label,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReuChecboxModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value &&
          isBoxChecked == other.isBoxChecked;

  @override
  int get hashCode => label.hashCode ^ value.hashCode ^ isBoxChecked.hashCode;
}

class ReuUiKitFieldCheckbox<T> extends StatefulWidget {
  final String label;
  final String? hint;
  final List<ReuChecboxModel<T>> items;
  final String? Function(List<ReuChecboxModel<T>> item)? validator;
  final Future<List<ReuChecboxModel<T>>> Function()? onFuture;
  final void Function(List<ReuChecboxModel<T>> values) onChanged;

  const ReuUiKitFieldCheckbox({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.onFuture,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ReuUiKitFieldCheckbox<T>> createState() =>
      _ReuUiKitFieldCheckboxState<T>();
}

class _ReuUiKitFieldCheckboxState<T> extends State<ReuUiKitFieldCheckbox<T>> {
  List<ReuChecboxModel<T>> items = [];

  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    loadItems();
  }

  loadItems() async {
    if (widget.onFuture == null) return;

    List<ReuChecboxModel<T>> newItems = await widget.onFuture!();
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
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            border: InputBorder.none,
            helperText: widget.hint,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(items[index].labelValue),
                value: items[index].isBoxChecked,
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      items[index] = items[index].onChangeIsBoxChecked(val);
                      field.didChange(true);
                    });

                    if (kDebugMode) {
                      print(items
                          .map((e) => '${e.labelValue} : ${e.isBoxChecked}'));
                    }
                    widget.onChanged(items);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
