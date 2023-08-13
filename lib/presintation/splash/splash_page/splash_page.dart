import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/home_page.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/splash/unsplash_page/unsplash_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const UnSplashPage(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: media.size.height * 100 / 812,
                width: media.size.width * 125 / 375,
                child: SvgPicture.asset('assets/icons_svg/stylish.svg')),
            StyleText.items(
                text: 'Stylish',
                size: 40,
                fontWeight: FontWeight.w700,
                color: const Color(0xffF83758)),
          ],
        ),
      ),
    );
  }
}
