import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReuUiKitFieldImagePicker extends StatelessWidget {
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final void Function(String) onFieldChanged;
  final String? provider;
  final TextEditingController textController;
  final bool isLoading;
  final FutureOr<void> Function()? onPressed;
  final String labelText;
  final String? imageUrl;

  const ReuUiKitFieldImagePicker({
    Key? key,
    this.value,
    this.validator,
    this.hint,
    required this.onFieldChanged,
    this.obscure = false,
    this.provider = "cloudinary",
    this.isLoading = false,
    required this.textController,
    this.onPressed,
    this.labelText = "",
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 72.0,
            width: 72.0,
            margin: const EdgeInsets.only(
              top: 8.0,
            ),
            decoration: BoxDecoration(
              color: isLoading ? Colors.blueGrey[900] : null,
              image: isLoading
                  ? null
                  : DecorationImage(
                      image: NetworkImage(imageUrl == null
                          ? "https://i.ibb.co/S32HNjD/no-image.jpg"
                          : imageUrl!),
                      fit: BoxFit.cover,
                    ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Visibility(
              visible: isLoading == true,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "UpisLoading...",
                      style: TextStyle(
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: FormField(
                initialValue: false,
                validator: (value) {
                  final currValidator = validator;
                  if (currValidator != null) {
                    return currValidator(imageUrl);
                  }

                  return null;
                },
                enabled: true,
                builder: (FormFieldState<bool> field) {
                  return TextFormField(
                    controller: textController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: labelText,
                      labelStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      suffixIcon: Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          width: 80.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isLoading
                                  ? Colors.grey[300]
                                  : Colors.blueGrey,
                            ),
                            onPressed: onPressed,
                            child: const Text(
                              "Browse",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      helperText: hint,
                      errorText: field.errorText,
                    ),
                    onChanged: onFieldChanged,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ReuUiKitFieldImagePickerOld extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final void Function(String) onChanged;
  final String? provider;

  const ReuUiKitFieldImagePickerOld({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
    this.obscure = false,
    this.provider = "cloudinary",
  }) : super(key: key);

  @override
  State<ReuUiKitFieldImagePickerOld> createState() =>
      _ReuUiKitFieldImagePickerOld();
}

class _ReuUiKitFieldImagePickerOld extends State<ReuUiKitFieldImagePickerOld> {
  String? imageUrl;
  bool isLoading = false;
  late TextEditingController controller;
  @override
  void initState() {
    imageUrl = widget.value;
    controller = TextEditingController(
      text: widget.value ?? "-",
    );
    super.initState();
  }

  Future<String?> getFileMultiplePlatform() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
      ],
      allowMultiple: false,
    );
    if (result == null) return null;
    return result.files.first.path;
  }

  Future<String?> getFileAndroidIosAndWeb() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    String? filePath = image?.path;
    if (filePath == null) return null;
    return filePath;
  }

  Future<String?> uploadFile(String filePath) async {
    if (widget.provider == "cloudinary") {
      return await uploadToCloudinary(filePath);
    }
    return await uploadToImgBB(filePath);
  }

  Future<String> uploadToImgBB(String filePath) async {
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];
    widget.onChanged(url);
    return url;
  }

  Future<String> uploadToCloudinary(String filePath) async {
    String cloudName = "dotz74j1p";
    String apiKey = "983354314759691";
    String apiSecret = "pw3e4KZX9Y9qv0zv68voHUtXKvQ";

    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
      'upload_preset': 'yogjjkoh',
      'api_key': apiKey,
    });

    var res = await Dio().post(
      'https://api.cloudinary.com/v1_1/cloudName/image/upload',
      data: formData,
    );

    String url = res.data["secure_url"];
    return url;
  }

  Future<void> browsePhoto() async {
    if (isLoading) return;

    String? filePath;
    isLoading = true;
    setState(() {});

    if (!kIsWeb && Platform.isWindows) {
      filePath = await getFileMultiplePlatform();
    } else {
      filePath = await getFileAndroidIosAndWeb();
    }
    if (filePath == null) return;

    imageUrl = await uploadFile(filePath);
    isLoading = false;

    if (imageUrl != null) {
      widget.onChanged(imageUrl!);
      controller.text = imageUrl!;
    }
    setState(() {});
  }

  String? get currentValue {
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 72.0,
            width: 72.0,
            margin: const EdgeInsets.only(
              top: 8.0,
            ),
            decoration: BoxDecoration(
              color: isLoading ? Colors.blueGrey[900] : null,
              image: isLoading
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                        imageUrl == null
                            ? "https://i.ibb.co/S32HNjD/no-image.jpg"
                            : imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Visibility(
              visible: isLoading == true,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "UpisLoading...",
                      style: TextStyle(
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: FormField(
                initialValue: false,
                validator: (value) {
                  return widget.validator!(imageUrl);
                },
                enabled: true,
                builder: (FormFieldState<bool> field) {
                  return TextFormField(
                    controller: controller,
                    obscureText: widget.obscure,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: widget.label,
                      labelStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      suffixIcon: Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          width: 80.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isLoading
                                  ? Colors.grey[300]
                                  : Colors.blueGrey,
                            ),
                            onPressed: () => browsePhoto(),
                            child: const Text(
                              "Browse",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      helperText: widget.hint,
                      errorText: field.errorText,
                    ),
                    onChanged: (value) {
                      widget.onChanged(value);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
