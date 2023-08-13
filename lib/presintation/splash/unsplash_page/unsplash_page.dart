import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/home_page.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/splash/unsplash_page/bloc/unsplash_bloc.dart';

class UnSplashPage extends StatelessWidget {
  const UnSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.of(context);
    return BlocBuilder<UnsplashBloc, UnsplashState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            }, child: StyleText.items(text: 'Skip', size: 18, fontWeight: FontWeight.w600,color: Colors.black)),
            ],
          ),
          body: SafeArea(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: media.size.height*177/812,),
                        SizedBox(
                          height: media.size.height*300/812,
                            width: media.size.width*300/375,
                            child: Image.asset(state.items[index].image)),
                        StyleText.items(text: state.items[index].title, size: 24, fontWeight: FontWeight.w800,color: Colors.black),
                        StyleText.items(text: state.items[index].description, size: 14, fontWeight: FontWeight.w600,color: const Color(0xffA8A8A9)),
                      ],
                    ),
                  ),
              itemCount:state.items.length,
            ),
          ),
        );
      },
    );
  }
}
