import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({super.key, required this.hint, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
        hint: Text(hint, style: TextStyle(color: kPrimaryColor)),
        hintStyle: TextStyle(color: kPrimaryColor),
        border: buildOutlineInputBorder(color: Colors.grey),
        enabledBorder: buildOutlineInputBorder(color: Colors.grey),
        focusedBorder: buildOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
