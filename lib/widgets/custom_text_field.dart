import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.keyBoardType,
  });

  final String hint;
  Function(String s)? onChanged;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardType,
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: hint,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
