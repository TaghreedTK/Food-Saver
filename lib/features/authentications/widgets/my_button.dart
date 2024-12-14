import 'package:flutter/material.dart';

class My_Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;
  const My_Button(
      {super.key,
      required this.onPressed,
      this.isLoading = false,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
