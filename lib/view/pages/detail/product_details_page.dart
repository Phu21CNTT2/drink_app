import 'package:flutter/material.dart';
import 'package:drinkapp/data_mau.dart';
import 'package:drinkapp/view/custom/product_details/topping.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Responsive.size(context) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      'assets/images/home_image/box2-homepage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Responsive.size(context) * 0.05,
                right: Responsive.size(context) * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Responsive.size(context) * 0.03),
                  Text(
                    'Tên món ăn',
                    style: TextStyleClass(fontWeight: FontWeight.w600)
                        .textStyleLarge(context),
                  ),
                  SizedBox(height: Responsive.size(context) * 0.03),
                  Text(
                    'Mô tả món ăn...',
                    style: TextStyleClass().textStyleMedium(context),
                    maxLines: 5,
                  ),
                  SizedBox(height: Responsive.size(context) * 0.03),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: Responsive.size(context) * 0.03),
                  Text(
                    'Topping',
                    style: TextStyleClass(fontWeight: FontWeight.w600)
                        .textStyleLarge(context),
                  ),
                  SizedBox(height: Responsive.size(context) * 0.03),
                  SizedBox(
                    height: Responsive.size(context) * 0.08 * topping.length,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: topping.length,
                      itemBuilder: (context, index) {
                        return Topping(name: topping[index]['name']);
                      },
                    ),
                  ),
                  SizedBox(height: Responsive.size(context) * 0.03),
                  const Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Ink(
        width: MediaQuery.of(context).size.width,
        height: Responsive.size(context) * 0.17,
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
            ),
            Row(
              children: [
                SizedBox(width: Responsive.size(context) * 0.05),
                Text(
                  'Giá: 100.000đ',
                  style: TextStyleClass().textStyleLarge(context),
                ),
                const Spacer(),
                Ink(
                  width: Responsive.size(context) * 0.2,
                  height: Responsive.size(context) * 0.11,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 180, 241, 255),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 166, 203),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: Add to cart
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.blue,
                      size: Responsive.size(context) * 0.07,
                    ),
                  ),
                ),
                SizedBox(width: Responsive.size(context) * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
