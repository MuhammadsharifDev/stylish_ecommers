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
        return  SafeArea(
          child: Scaffold(
            appBar: AppBar(
             // backgroundColor: const Color(0xffF9F9F9),
              toolbarHeight: 180,
              leading: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(child: Icon(Icons.sort)),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.stylish_icon),
                  Text('Stylish',style: GoogleFonts.libreCaslonText(fontSize: 18,fontWeight: FontWeight.w700,color: const Color(0xff4392F9)),),
                ],
              ),
              bottom:  PreferredSize(
                preferredSize: const Size.fromHeight(5.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                    child: TextField(
                      decoration: TextFieldItems.items(prefIcon:Icons.search_rounded, suffIcon: Icons.keyboard_voice_outlined),
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
            body:  Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.009,),
                    StyleText.items(text: 'All Featured', size: 18, fontWeight: FontWeight.w700),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    Container(
                      width: double.infinity,
                      height: 90,
                      color: Colors.red,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            height: 50,
                            width: 65,
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Image.asset(state.items[index].image),
                              ],
                            ),
                          ),
                          itemCount: state.items.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16,),
                      ),
                    ),
                  ],
              ),
            ),
          ),
        );
      },
    );
  }
}
