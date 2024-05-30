import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:drinkapp/data_mau.dart';
import 'package:drinkapp/view/custom/home/item_list_vertical.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class ProductTypePage extends StatelessWidget {
  const ProductTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: const Text(
        'Tốt cho sức khỏe',
        style: TextStyle(color: Colors.white),
      ),
      headerExpandedHeight: 0.35,
      headerWidget: Column(
        children: [
          SizedBox(
            height: Responsive.size(context) * 0.15,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.arrow_back_ios, color: Colors.white)),
                Text(
                  'Tốt cho sức khỏe',
                  style: TextStyleClass(
                          fontWeight: FontWeight.w500, color: Colors.white)
                      .textStyleLarge(context),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33 -
                Responsive.size(context) * 0.115,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Image.network(
                'https://th.bing.com/th/id/OIP.a0B9zXpBdOcSzYm-V3C5WgHaE6?pid=ImgDet&rs=1',
                fit: BoxFit.cover,
                //width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
      body: [
        ItemListVertical(data: items),
      ],
    );
  }
}
