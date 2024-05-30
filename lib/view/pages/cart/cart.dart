import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:drinkapp/view/pages/cart/add_cart.dart';
import 'package:drinkapp/view/pages/cart/bottom_bar.dart';
import 'package:drinkapp/view/pages/cart/pay.dart';
import 'package:drinkapp/view/resource/responsive.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      minExtent: Responsive.size(context) * 0.2,
      useSafeArea: true,
      barrierDismissible: false,
      barrierColor: const Color.fromARGB(60, 255, 255, 255),
      previewWidget: const BottomBar(),
      expandedWidget: const Pay(),
      backgroundWidget: const AddCart(),
      duration: const Duration(milliseconds: 10),
      maxExtent: Responsive.size(context) * 0.7,
      expansionExtent: Responsive.size(context) * 0.45,
      onDragging: (pos) {},
    );
  }
}
