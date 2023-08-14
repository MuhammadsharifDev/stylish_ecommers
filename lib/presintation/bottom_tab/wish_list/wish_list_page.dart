import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/wish_list/bloc/wishlist_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/wish_list/widgets/appbar_widget.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_images.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffF9F9F9),
            toolbarHeight: 180,
            leading: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: CircleAvatar(child: Icon(Icons.sort)),
            ),
            title: const AppBarTitleWidget(),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5.0),
              child:AppBarBottomWidget(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(child: Image.asset(AppImages.profile)),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    StyleText.items(
                        text: '52,082+ Iteams ',
                        size: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
