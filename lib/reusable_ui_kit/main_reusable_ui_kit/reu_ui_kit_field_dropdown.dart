import 'package:flutter/material.dart';

class ReuDropdownModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;
  final T value;

  ReuDropdownModel({this.label, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
    };
  }

  String get labelValue => label ?? value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReuDropdownModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}

class ReuUiKitFieldDropdown<T> extends StatefulWidget {
  final String label;
  final String? hint;
  final List<ReuDropdownModel<T>> items;
  final ReuDropdownModel<T>? emptyValue;
  final String? Function(ReuDropdownModel<T>? value)? validator;

  /// Prefer use index for inital value for get value in list [items]
  final int indexOfInitialValue;
  final Function(ReuDropdownModel<T>) onChanged;

  const ReuUiKitFieldDropdown({
    Key? key,
    required this.label,
    required this.items,
    this.emptyValue,
    required this.onChanged,
    this.indexOfInitialValue = 0,
    this.validator,
    this.hint,
  }) : super(key: key);

  @override
  State<ReuUiKitFieldDropdown<T>> createState() =>
      _ReuUiKitFieldDropdownState<T>();
}

class _ReuUiKitFieldDropdownState<T> extends State<ReuUiKitFieldDropdown<T>> {
  List<ReuDropdownModel<T>> items = [];
  ReuDropdownModel<T>? selectedValue;

  @override
  void initState() {
    super.initState();

    items = [];
    final getEmptyValue = widget.emptyValue;
    if (getEmptyValue != null) {
      items.add(getEmptyValue);
    }

    for (var item in widget.items) {
      items.add(item);
    }

    assert(items
        .isNotEmpty); // Make sure to list in here not empty. if is, break prosses.
    assert(widget.indexOfInitialValue <
        widget.items.length -
            1); // Make sure to indexOfInitialValue not greates than length of item list. if is, break prosses.
    selectedValue = widget.items[widget.indexOfInitialValue];
  }

  setAllItemsToFalse() {
    for (var item in items) {}
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      validator: (value) {
        if (widget.validator != null) {
          if (widget.emptyValue == selectedValue) {
            return widget.validator!(null);
          }
          return widget.validator!(selectedValue);
        }
        return null;
      },
      enabled: true,
      builder: (FormFieldState<bool> field) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            helperText: widget.hint,
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: false,
              child: SizedBox(
                child: DropdownButton<ReuDropdownModel<T>>(
                  isExpanded: true,
                  value: selectedValue,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 24.0,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  iconSize: 16,
                  elevation: 16,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium!.fontFamily,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                  underline: Container(
                    height: 0,
                    color: Colors.grey[300],
                  ),
                  onChanged: (ReuDropdownModel<T>? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValue = newValue;
                        widget.onChanged(newValue);
                      });
                    }
                  },
                  items: List.generate(
                    items.length,
                    (index) {
                      var item = items[index];
                      return DropdownMenuItem<ReuDropdownModel<T>>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical: 0.0,
                          ),
                          child: Text(
                            item.labelValue,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
