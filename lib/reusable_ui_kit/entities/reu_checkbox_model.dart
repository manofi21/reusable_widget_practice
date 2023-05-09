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
      isBoxChecked: isBoxChanged,
      label: label,
    );
  }

  ReuChecboxModel<T> onUserInsertNewValue({required String userInput}) {
    return ReuChecboxModel<T>(
      value: value,
      isBoxChecked: true,
      label: userInput,
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