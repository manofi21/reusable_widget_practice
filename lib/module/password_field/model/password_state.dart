import 'package:flutter/material.dart';

enum StatusPassword {
  init,
  bad,
  average,
  good,
}

extension StatusPasswordExtens on StatusPassword {
  String toUpperCase() =>this != StatusPassword.init ? name.toUpperCase() : "";

  Color get getColor {
    switch (this) {
      case StatusPassword.bad:
        return Colors.red;
      case StatusPassword.average:
        return Colors.orange;
      case StatusPassword.good:
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  bool get isInit =>  StatusPassword.init == this;
}
