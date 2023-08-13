



import 'package:flutter/material.dart';

class ElevatedStyle{
  static ButtonStyle style({required double height,required double radius}){
    return  ElevatedButton.styleFrom(
      minimumSize:  Size(double.infinity, height),
      backgroundColor: const Color(0xffF83758),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}