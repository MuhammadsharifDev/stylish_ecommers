import 'package:flutter/material.dart';

class TextFieldItems {
  static InputDecoration items(
      {required IconData? prefIcon,
      var suffIcon,
      required String hintex,
      required double radius,
      Color? color}) {

    return InputDecoration(
      suffixIcon: suffIcon,
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
