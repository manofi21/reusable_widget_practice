import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

/// Funcion can be change/update.
Future<List<XFile>> getFileMultiplePlatform() async {
  return ImagePicker().pickMultiImage();
}

extension ListXFileExtension on List<XFile> {
  String get nameOfValue {
    final getListName = map((e) => '"${e.name}"').toList();
    final valuesOfName = getListName.join(', ');
    return valuesOfName;
  }

  Future<List<Uint8List>> get listOfUint8ListImg async {
    return Future.wait(map((e) => e.readAsBytes()).toList());
  }
}
