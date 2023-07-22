import 'package:flutter/material.dart';
import 'package:notes_app/costant/costant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.onchange, this.onsaved, required this.hint, this.maxlines = 1});
  final String hint;
  final int maxlines;
  final Function(String)? onchange;
  final Function(dynamic)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' * is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: KPrimaryColor,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: KPrimaryColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white,
            )),
      ),
    );
  }
}
