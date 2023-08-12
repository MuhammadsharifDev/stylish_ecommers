import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText {

  static Text items(
      {required String text, required double size, required var fontWeight, Color? color}) {
    return Text(text, style: GoogleFonts.montserrat(
        color: color, fontWeight: fontWeight, fontSize: size),);
  }
}