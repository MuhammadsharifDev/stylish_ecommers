import 'package:flutter/material.dart';

class TextFieldItems {
  static InputDecoration items(
      {required IconData? prefIcon,
      required IconData? suffIcon,
      required String hintex,
      required double radius,
      Color? color}) {

    return InputDecoration(
      suffixIcon: Icon(suffIcon),
      prefixIcon: Icon(prefIcon),
      filled: true,
      fillColor: color,
      hintText: hintex,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
