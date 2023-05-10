class ReuAutopopulateModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;
  final T value;

  ReuAutopopulateModel({this.label, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
    };
  }

  String get labelValue => label ?? value.toString();

  ReuAutopopulateModel<T> onChangeIsBoxChecked(bool isBoxChanged) {
    return ReuAutopopulateModel<T>(
      value: value,
      label: label,
    );
  }

  ReuAutopopulateModel<T> onUserInsertNewValue({required String userInput}) {
    return ReuAutopopulateModel<T>(
      value: value,
      label: userInput,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReuAutopopulateModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}