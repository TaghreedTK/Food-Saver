import 'package:flutter/material.dart';

class TAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;

  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool? expands;
  final bool? enabled;
  const TAuthTextField(
      {super.key,
      required this.controller,
      required this.decoration,
      this.textInputType = TextInputType.text,
      this.validator,
      this.expands,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: decoration,
    );
  }
}
