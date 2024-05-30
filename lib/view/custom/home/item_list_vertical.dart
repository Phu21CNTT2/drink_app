import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../resource/responsive.dart';
import '../../resource/text_style.dart';

class ItemListVertical extends StatefulWidget {
  final List<dynamic> data;
  final String? name;
  const ItemListVertical({super.key, required this.data, this.name});

  @override
  State<ItemListVertical> createState() => _ItemListVerticalState();
}

class _ItemListVerticalState extends State<ItemListVertical> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.data.length < 5 ? widget.data.length : 5;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {});
                //getData();
                if (kDebugMode) {
                  print(widget.data[4]['product_name']);
                }
                // TODO hành động khi ấn vào tiêu đề
              },
              child: Text(
                widget.name ?? '',
                style: TextStyleClass().textStyleLarge(context),
                maxLines: 1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Responsive.size(context) / 2.7 * itemCount,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              String image = widget.data[index]['product_images'] ?? '';

              String name = widget.data[index]['product_name'] ?? '';

              String description =
                  widget.data[index]['product_description'] ?? '';
              String price = widget.data[index]['price'] ?? '';
              return InkWell(
                onTap: () {
                  // TODO hành động khi ấn vào item
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.size(context) * 0.03,
                    right: Responsive.size(context) * 0.03,
                    top: Responsive.size(context) * 0.03,
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    )),
                    height: Responsive.size(context) / 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: Responsive.size(context) * 0.03,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Responsive.size(context) / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Responsive.size(context) * 0.03,
                                right: Responsive.size(context) * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    name,
                                    textAlign: TextAlign.center,
                                    style: TextStyleClass()
                                        .textStyleMedium(context),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    description,
                                    style: TextStyleClass()
                                        .textStyleSmall(context),
                                    maxLines: 3,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        price,
                                        style: TextStyleClass(
                                                fontWeight: FontWeight.bold)
                                            .textStyleMedium(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
