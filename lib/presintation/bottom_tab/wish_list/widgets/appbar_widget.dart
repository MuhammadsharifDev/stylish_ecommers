import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.stylish_icon),
        Text(
          'Stylish',
          style: GoogleFonts.libreCaslonText(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xff4392F9)),
        ),
      ],
    );
  }
}


class AppBarBottomWidget extends StatelessWidget {
  const AppBarBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
        const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: TextField(
          decoration: TextFieldItems.items(
            prefIcon: Icons.search_rounded,
            suffIcon: const Icon(Icons.keyboard_voice_outlined),
            hintex: 'Search..',
            radius: 6,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

