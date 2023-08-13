



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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


class SocialElevatedBottom{
  static ElevatedButton item ({required String icon}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        side: const BorderSide(color: Colors.red, width: 1),
      ),
      child: SvgPicture.asset(icon),
      onPressed: () {},
    );

  }
}