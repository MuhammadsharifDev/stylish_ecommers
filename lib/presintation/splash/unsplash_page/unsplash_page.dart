import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/login_page.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/splash/unsplash_page/bloc/unsplash_bloc.dart';

class UnSplashPage extends StatefulWidget {
  const UnSplashPage({super.key});

  @override
  State<UnSplashPage> createState() => _UnSplashPageState();
}

class _UnSplashPageState extends State<UnSplashPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<UnsplashBloc, UnsplashState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Text('${state.index + 1} / 3'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: StyleText.items(
                      text: 'Skip',
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
          body: SafeArea(
            child: PageView.builder(
              itemCount: state.items.length,
              onPageChanged: (index) {
                context.read<UnsplashBloc>().add(ChangeEvent(index: index));
              },
              itemBuilder: (context, index) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: media.size.height * 177 / 812,
                    ),
                    SizedBox(
                        height: media.size.height * 300 / 812,
                        width: media.size.width * 300 / 375,
                        child: Image.asset(state.items[index].image)),
                    StyleText.items(
                        text: state.items[index].title,
                        size: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                    StyleText.items(
                        text: state.items[index].description,
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffA8A8A9)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 7,
                            child: state.index == 0
                                ? Container(
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  )
                                : const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.grey,
                                  )),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            height: 7,
                            child: state.index == 1
                                ? Container(
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.circular(100)),
                            )
                                : const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.grey,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            height: 7,
                            child: state.index == 2
                                ? Container(
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.circular(100)),
                            )
                                : const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.grey,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
