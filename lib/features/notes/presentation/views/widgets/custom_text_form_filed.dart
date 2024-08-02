import 'package:flutter/material.dart';
import 'package:notes_app/core/helper/utils/constants.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.onSaved,
    required this.fontSize,
    this.focusNode,
    this.controller,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final double fontSize;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: fontSize, color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (value.trim().replaceAll(' ', '') == '') {
          return 'Spaces are not allowed';
        }
        return null;
      },
      controller: controller,
      onSaved: onSaved,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      focusNode: focusNode,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.grey,
        ),
      ),
      minLines: 1,
      maxLines: null,
    );
  }
}
