import 'package:flutter/material.dart';

class AddRecipeField extends StatelessWidget {
  final TextInputAction? action;
  final TextEditingController controller;
  final String hint;
  final int? lines;
  final String? Function(String?)? validate;
  final TextInputType? type;
  const AddRecipeField({
    Key? key,
    required this.controller,
    required this.hint,
    this.lines,
    this.action,
    this.validate,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      textInputAction: action,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      validator: validate,
      keyboardType: type,
    );
  }
}
