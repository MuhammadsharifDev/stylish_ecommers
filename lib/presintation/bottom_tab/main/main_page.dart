import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/basket/basket_page.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/home_page.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/search/search_page.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/setting/setting_page.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/wish_list/wish_list_page.dart';

import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children:  [
              HomePage(),
              WishListPage(),
              BasketPage(),
              SearchPage(),
              SettingPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomMenu.index,
            onTap: (index) {
              context
                  .read<MainBloc>()
                  .add(SetBottomMenuEvent(menu: BottomMenu.values[index]));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border_sharp), label: 'WishList'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
