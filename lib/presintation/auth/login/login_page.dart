import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/bloc/login_bloc.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/elevated_bottom_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 63,
                  ),
                  StyleText.items(
                      text: 'Welcome\n Back!',
                      size: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  const SizedBox(
                    height: 36,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: TextFieldItems.items(
                      prefIcon: Icons.person,
                      hintex: 'Username or Email',
                      radius: 10,
                      color: Colors.grey.withOpacity(0.1),
                      suffIcon: null,
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: TextFieldItems.items(
                      prefIcon: Icons.lock,
                      hintex: 'Password',
                      radius: 10,
                      color: Colors.grey.withOpacity(0.1),
                      suffIcon: Icons.visibility,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: StyleText.items(
                          text: 'Forgot password?',
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffF83758),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  ElevatedButton(
                    style: ElevatedStyle.style( height: 55, radius: 4),
                    onPressed: () {},
                    child: Align(
                        alignment: Alignment.center,
                        child: StyleText.items(
                          text: 'Login',
                          size: 20,
                          fontWeight: FontWeight.w600,color: Colors.white,
                        ),
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*75/812),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialElevatedBottom.item(icon: AppIcons.apple_icon),
                      SocialElevatedBottom.item(icon: AppIcons.apple_icon),
                      SocialElevatedBottom.item(icon: AppIcons.apple_icon),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyleText.items(text: 'Create An Account', size: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                      TextButton(
                        onPressed: () {},
                        child: StyleText.items(
                          text: 'Sign Up',
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffF83758),
                        ),
                      ),
                    ],
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
