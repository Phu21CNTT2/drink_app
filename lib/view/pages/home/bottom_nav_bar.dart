import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drinkapp/view/pages/cart/add_cart.dart';
import 'package:drinkapp/view/pages/home/home_page.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

import '../../../data_mau.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  static String route = '/bottom_nav_bar_page';

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<IconData> _icons = [
    Icons.home,
    Icons.message,
    Icons.no_meals_rounded,
    Icons.person,
  ];

  final List<Color> _iconColors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  final List<dynamic> _pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: Responsive.size(context) * 0.15,
        items: _icons.asMap().entries.map((entry) {
          int index = entry.key;
          IconData icon = entry.value;
          return Icon(
            icon,
            size: Responsive.size(context) * 0.075,
            color: _page == index ? _iconColors[index] : Colors.grey,
          );
        }).toList(),
        color: const Color.fromARGB(255, 237, 236, 236),
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(0, 199, 10, 10),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pages[_page],
      floatingActionButton: Stack(
        children: [
          // xét độ lớn của Floa
          // icon cart và số lượng được thêm
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCart(),
                ),
              );
            },
            backgroundColor: Colors.red,
            child: Icon(
              Icons.shopping_cart,
              size: Responsive.size(context) * 0.08,
            ),
          ),
          Positioned(
            top: Responsive.size(context) * 0.025,
            right: Responsive.size(context) * 0.02,
            child: Container(
              width: Responsive.size(context) * 0.05,
              height: Responsive.size(context) * 0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '${items.length}',
                  style: TextStyleClass(
                          color: Colors.red, fontWeight: FontWeight.bold)
                      .textStyleSmall(context),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
