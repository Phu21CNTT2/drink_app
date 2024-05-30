import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:drinkapp/model/account_model.dart';
import 'package:drinkapp/view/pages/Home/bottom_nav_bar.dart';
import 'package:drinkapp/view/pages/auth/onboarding_page.dart';
import 'package:drinkapp/view/pages/auth/signin_page.dart';
import 'package:drinkapp/view/resource/app_color.dart';
import 'package:flutter/material.dart';

bool _first = true;

class PlashTimePage extends StatefulWidget {
  static const routeName = '/plash_time_page';
  const PlashTimePage({super.key});

  @override
  State<PlashTimePage> createState() => _PlashTimePageState();
}

class _PlashTimePageState extends State<PlashTimePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (_first) {
        _first = false;
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const OnboardingPage()), (route) => false);  
      } else if (AccountModel().isExits()) {
        Navigator.of(context).pushNamedAndRemoveUntil(BottomNavBarPage.route, (route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(SignInPage.routeName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColor.colorApp,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/plash_image/plash_character.gif',
                width: 300.0,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF3F3D56),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caprasimo'),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 3),
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Drink App',
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
