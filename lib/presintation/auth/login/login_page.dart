import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/bloc/login_bloc.dart';
import 'package:stylish_ecommers_app/presintation/auth/login/mixin/mixin_page.dart';
import 'package:stylish_ecommers_app/presintation/auth/sign_up/sign_up_page.dart';
import 'package:stylish_ecommers_app/presintation/bottom_tab/main/main_page.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/elevated_bottom_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/text_style.dart';
import 'package:stylish_ecommers_app/presintation/const/theme_data/textfield_items.dart';
import 'package:stylish_ecommers_app/presintation/const/utils/app_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin{




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return MainPage();
            }
            else {
             return  Scaffold(
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
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Please enter your Email";
                          }
                          String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                          RegExp regExp = RegExp(pattern);
                          if(!regExp.hasMatch(value)){
                            return "You enter invalid email";
                          }
                        },
                        controller: emailController,
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
                        obscureText: state.isVisible,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your password';
                          }
                        },
                        decoration: TextFieldItems.items(
                          prefIcon: Icons.lock,
                          hintex: 'Password',
                          radius: 10,
                          color: Colors.grey.withOpacity(0.1),
                          suffIcon: IconButton(onPressed: (){
                            context.read<LoginBloc>().add(IsVisibleEvent(isVisibleIcon: !state.isVisible));
                          }, icon: Icon(state.isVisible?Icons.visibility_off:Icons.visibility)),
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
                        onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<LoginBloc>().add(GmailEvent(email: emailController.text, password: passwordController.text));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(),
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

                          context.read<LoginBloc>().add(GmailEvent(email: emailController.text, password: passwordController.text));
                        },
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
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                            },
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
            }
          },
        );
      },
    );
  }
}
