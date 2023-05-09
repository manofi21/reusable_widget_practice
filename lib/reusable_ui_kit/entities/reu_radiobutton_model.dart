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

  ReuRadioButtonModel<T> onUserInsesrtNewValue({required String userInput}) {
    return ReuRadioButtonModel<T>(
      value: value,
      isRadioChoose: true,
      label: userInput,
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