

import 'package:flutter/cupertino.dart';

class ContainerStyle{

  static Container items({required double size,required double radius,}){
    return Container(
        height: size,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
      );
  }
}