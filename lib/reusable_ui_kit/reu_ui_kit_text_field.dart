import 'package:flutter/material.dart';

class ReuUiKitTextField extends StatefulWidget {
  const ReuUiKitTextField({super.key});

  @override
  State<ReuUiKitTextField> createState() => _ReuUiKitTextFieldState();
}

class _ReuUiKitTextFieldState extends State<ReuUiKitTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      decoration: const InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        helperText: "What's your name?",
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'First Name tidak boleh kosong';
        }
      },
      // onChanged: (value) {},
    );
  }
}
