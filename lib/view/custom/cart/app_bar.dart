import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: Responsive.size(context) * 0.15,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          Text(
            'Trang thanh toán',
            style:
                TextStyleClass(fontWeight: FontWeight.w500, color: Colors.white)
                    .textStyleLarge(context),
          ),
        ],
      ),
    );
  }
}
