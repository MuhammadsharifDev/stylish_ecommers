
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TextFieldItems {

  static InputDecoration items ({required IconData? prefIcon,required IconData? suffIcon}){
    return InputDecoration(
      suffixIcon: Icon(suffIcon),
      prefixIcon: Icon(prefIcon),
      filled: true,
      fillColor:Colors.white,
      hintText: 'Search...',
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

}