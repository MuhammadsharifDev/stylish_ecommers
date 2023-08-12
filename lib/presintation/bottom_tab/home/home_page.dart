import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            appBar: AppBar(
              backgroundColor: const Color(0xffF9F9F9),
              toolbarHeight: 180,
              leading: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(child: Icon(Icons.sort)),
              ),
              title: Row(
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
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                    child: TextField(
                      decoration: TextFieldItems.items(
                        prefIcon: Icons.search_rounded,
                        suffIcon: Icons.keyboard_voice_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(child: Image.asset(AppImages.profile)),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
                  StyleText.items(
                      text: 'All Featured',
                      size: 18,
                      fontWeight: FontWeight.w700),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    width: double.infinity,
                    height: 95,
                    color: Colors.white70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              state.items[index].image,
                            ),
                            Text(state.items[index].text),
                          ],
                        ),
                      ),
                      itemCount: state.items.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Stack(children: [
                   Container(
                       height: 189,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: Image.asset('assets/image_png/Rectangle 48.png',fit: BoxFit.cover,)),
                    Positioned(
                      top: 40,
                      left: 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyleText.items(
                              text: '50-40% OFF',
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          StyleText.items(text: 'Now in (product', size: 12, fontWeight: FontWeight.w400),
                          StyleText.items(text: 'All colours', size: 12, fontWeight: FontWeight.w400),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 32),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: const BorderSide(color: Colors.white),
                                  )
                              ),
                              onPressed: (){}, child: const Center(child: Text('Shop Now ->'))),
                        ],
                      ),
                    ),
                  ]
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
