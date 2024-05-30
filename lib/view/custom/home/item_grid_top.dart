import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/text_style.dart';

import '../../resource/responsive.dart';

class ItemGridViewTop extends StatelessWidget {
  final List<dynamic>? data;
  const ItemGridViewTop({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.size(context) / 2,
      padding: EdgeInsets.only(
        top: Responsive.size(context) * 0.03,
        bottom: Responsive.size(context) * 0.03,
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột trong GridView
            // mainAxisSpacing:
            //     10, // Khoảng cách giữa các phần tử theo chiều ngang
            crossAxisSpacing: 10, // Khoảng cách giữa các phần tử theo chiều dọc
            childAspectRatio: 0.43, //Tỉ lệ chiều rộng / chiều cao
          ),
          scrollDirection: Axis.horizontal,
          itemCount: data?.length,
          itemBuilder: (BuildContext context, int index) {
            String image = data?[index]['category_image'] ?? '';
            String name = data?[index]['category_name'] ?? '';
            return Padding(
              padding: EdgeInsets.only(
                left: Responsive.size(context) * 0.03,
                right: Responsive.size(context) * 0.03,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/product_type_page');
                },
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset(
                            'assets/images/home_image/box2-homepage.png')),
                    Positioned(
                      left: Responsive.size(context) * 0.08,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Responsive.size(context) * 0.2,
                                child: Text(
                                  name,
                                  style:
                                      TextStyleClass().textStyleMedium(context),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: Responsive.size(context) * 0.03),
                            ],
                          ),
                          Expanded(
                            child: Image.network(image),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
