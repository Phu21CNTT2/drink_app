import 'package:flutter/material.dart';
import 'package:drinkapp/view/pages/home/bottom_nav_bar.dart';
import 'package:drinkapp/view/pages/auth/plash_time_page.dart';
import 'package:drinkapp/view/pages/detail/product_type_page.dart';
import 'package:drinkapp/view/pages/auth/signin_page.dart';
import 'package:drinkapp/view/pages/auth/signup_page.dart';
import 'package:drinkapp/view/pages/cart/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    fadePageRoute(Widget page) => PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

    return SafeArea(
      child: MaterialApp(
        title: 'MIMO FOOD & DRINK',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/sign_in_page':
              return fadePageRoute(SignInPage());
            case '/sign_up_page':
              return fadePageRoute(SignUpPage());
            case '/bottom_nav_bar_page':
              return fadePageRoute(const BottomNavBarPage());
            case '/product_type_page':
              return fadePageRoute(const ProductTypePage());
            case '/cart_page':
              return fadePageRoute(const Cart());
            default:
              return fadePageRoute(const PlashTimePage());
          }
        },
      ),
    );
  }
}
