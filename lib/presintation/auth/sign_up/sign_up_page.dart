import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/login_page.dart';
import 'package:stylish_ecommers_app/presintation/auth/sign_up/bloc/signup_bloc.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/home/home_page.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/elevated_bottom_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Form(
          key: _formkey,
          child: Scaffold(
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
                        text: 'Create an\n accaunt',
                        size: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    const SizedBox(
                      height: 36,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Email";
                        }
                        String pattern =
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return "You enter invalid email";
                        }
                      },
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
                    TextFormField(
                      controller: passwordController,
                      obscureText: state.isVisibleIcon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                      },
                      decoration: TextFieldItems.items(
                        prefIcon: Icons.lock,
                        hintex: 'Password',
                        radius: 10,
                        color: Colors.grey.withOpacity(0.1),
                        suffIcon: IconButton(
                            onPressed: () {
                                context.read<SignupBloc>().add(VisibleEvent(isVisible: !state.isVisibleIcon));
                            },
                            icon: Icon(state.isVisibleIcon?Icons.visibility_off:Icons.visibility)),
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter again password';
                        }
                      },
                      decoration: TextFieldItems.items(
                          prefIcon: Icons.lock,
                          suffIcon: IconButton(
                              onPressed: () {
                                context.read<SignupBloc>().add(VisibleEvent(isVisible: !state.isVisibleIcon));
                              },
                              icon: Icon(state.isVisibleIcon?Icons.visibility_off:Icons.visibility),),
                          hintex: 'ConfirmPassword',
                          radius: 10,
                          color: Colors.grey.withOpacity(0.1)),

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
                      style: ElevatedStyle.style(height: 55, radius: 4),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          if (usernameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Ma'lumot to'liq emas",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: StyleText.items(
                          text: 'Creat Accaunt',
                          size: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 75 / 812),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialElevatedBottom.item(icon: AppIcons.apple_icon),
                        SocialElevatedBottom.item(icon: AppIcons.apple_icon),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                    side: const BorderSide(color: Colors.red, width: 1),
                  ),
                  child: SvgPicture.asset(AppIcons.apple_icon),
                  onPressed: () {},
                ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyleText.items(
                            text: 'I Already Have an Account',
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                          },
                          child: StyleText.items(
                            text: 'Login',
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
          ),
        );
      },
    );
  }
}
