import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/splash/unsplash_page/bloc/unsplash_bloc.dart';

class UnSplashPage extends StatelessWidget {
  const UnSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnsplashBloc, UnsplashState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Text('1/3'),
            actions: [
              Text('Skip')
            ],
          ),
          body: SafeArea(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  Center(
                    child: Column(
                      children: [
                        Image.asset(state.items[index].image),
                        StyleText.items(text: state.items[index].title, size: 24, fontWeight: FontWeight.w800,color: const Color(0xff000)),
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
