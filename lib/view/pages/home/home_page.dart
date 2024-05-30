import 'package:flutter/material.dart';
import 'package:drinkapp/view/custom/home/carousel_slider.dart';
import 'package:drinkapp/view/custom/home/header.dart';
import 'package:drinkapp/view/custom/home/item_grid_bottom.dart';
import 'package:drinkapp/view/custom/home/item_list_horizontal.dart';
import 'package:drinkapp/view/custom/home/item_list_vertical.dart';

import '../../../data_mau.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),
            CarouselSliderHome(slides: slide),
            ItemListHorizontal(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
            ItemGridViewBottom(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
            ItemListVertical(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
          ],
        ),
      ),
    );
  }
}
