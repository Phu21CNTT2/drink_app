import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class ItemListHorizontal extends StatelessWidget {
  final String? name;
  final List<dynamic>? data;
  const ItemListHorizontal({
    super.key,
    this.name,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            // TODO hành động khi ấn vào tiêu đề
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: Responsive.size(context) * 0.03,
              right: Responsive.size(context) * 0.03,
              top: Responsive.size(context) * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? '',
                  style: TextStyleClass().textStyleLarge(context),
                  maxLines: 1,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Responsive.size(context) / 2,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data!.length < 9 ? data!.length : 9,
            itemBuilder: (BuildContext context, int index) {
              String image = data?[index]['product_images'] ?? '';

              String name = data?[index]['product_name'] ?? '';

              String price = data?[index]['price'] ?? '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // TODO hành động khi ấn vào item
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 203, 202, 202)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: Responsive.size(context) / 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.contain,
                              ),
                            ),
                            height: Responsive.size(context) / 3.5,
                            width: Responsive.size(context) / 3.5,
                          ),
                        ),
                        SizedBox(
                          height: Responsive.size(context) * 0.01,
                        ),
                        Text(
                          name,
                          style: TextStyleClass().textStyleMedium(context),
                        ),
                        const Divider(
                          height: 0.001,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.discount_sharp,
                                color: const Color.fromARGB(141, 181, 19, 7),
                                size: Responsive.size(context) * 0.05,
                              ),
                              SizedBox(
                                width: Responsive.size(context) * 0.01,
                              ),
                              Text(
                                price,
                                style:
                                    TextStyleClass(fontWeight: FontWeight.bold)
                                        .textStyleMedium(context),
                                maxLines: 1,
                              ),
                              const Spacer(),
                              Text(
                                '4.5',
                                style:
                                    TextStyleClass().textStyleMedium(context),
                              ),
                              SizedBox(
                                width: Responsive.size(context) * 0.01,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: Responsive.size(context) * 0.07,
        ),
      ],
    );
  }
}
