import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/firebase_options.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/bloc/login_bloc.dart';
import 'package:stylish_ecommers_app/presintation/auth/sign_up/bloc/signup_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/basket/bloc/basket_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/bloc/home_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/search/bloc/search_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/setting/bloc/setting_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/wish_list/bloc/wishlist_bloc.dart';
import 'package:stylish_ecommers_app/presintation/splash/splash_page/splash_page.dart';
import 'package:stylish_ecommers_app/presintation/splash/unsplash_page/bloc/unsplash_bloc.dart';
import 'presintation/bottom_tab/main/bloc/main_bloc.dart';
import 'service/notification_service.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainBloc()),
        BlocProvider(create: (_) => HomeBloc()..add(LoadDataEvent())),
        BlocProvider(create: (_) => WishlistBloc()),
        BlocProvider(create: (_) => BasketBloc()),
        BlocProvider(create: (_) => SearchBloc()),
        BlocProvider(create: (_) => SettingBloc()),
        BlocProvider(create: (_) => UnsplashBloc()..add(PageViewEvent())),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SignupBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashPage()),
    );
  }
}
