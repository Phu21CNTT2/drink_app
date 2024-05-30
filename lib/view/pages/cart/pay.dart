import 'package:flutter/material.dart';

import '../../resource/responsive.dart';
import '../../resource/text_style.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Responsive.size(context) * 0.03,
            ),
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: Responsive.size(context) * 0.01),
                  child: Icon(
                    Icons.note_alt_outlined,
                    color: Colors.red,
                    size: Responsive.size(context) * 0.08,
                  ),
                ),
                SizedBox(
                  width: Responsive.size(context) * 0.02,
                ),
                Text(
                  'Thông tin đơn hàng',
                  style: TextStyleClass(fontWeight: FontWeight.w500)
                      .textStyleLarge(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(top: Responsive.size(context) * 0.01),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                      //TODO: Chuyển sang trang SDT
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Responsive.size(context) * 0.01),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: Responsive.size(context) * 0.01),
                            child: Icon(
                              Icons.phone,
                              color: Colors.blue,
                              size: Responsive.size(context) * 0.06,
                            ),
                          ),
                          SizedBox(
                            width: Responsive.size(context) * 0.02,
                          ),
                          Text(
                            '0966043414',
                            style: TextStyleClass(fontWeight: FontWeight.w500)
                                .textStyleSmall(context),
                            maxLines: 4,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  InkWell(
                    onTap: () {
                      //TODO: Chuyển sang trang map
                    },
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Responsive.size(context) * 0.01),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: Responsive.size(context) * 0.01),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                              size: Responsive.size(context) * 0.06,
                            ),
                          ),
                          SizedBox(
                            width: Responsive.size(context) * 0.02,
                          ),
                          Text(
                            '459-Tôn Đức Thắng-Hòa Khánh Nam-Liên Chiểu-ĐN',
                            style: TextStyleClass(fontWeight: FontWeight.w500)
                                .textStyleSmall(context),
                            maxLines: 4,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Thông tin đơn hàng
          Padding(
            padding: EdgeInsets.only(top: Responsive.size(context) * 0.025),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      Responsive.size(context) * 0.03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phương thức",
                          style: TextStyleClass(fontWeight: FontWeight.bold)
                              .textStyleMedium(context),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //TODO:Hình thức đặt đơn
                              },
                              style: ButtonStyle(
                                backgroundColor: selected
                                    ? MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 175, 14, 2))
                                    : MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(
                                            255, 200, 197, 197)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: Responsive.size(context) * 0.02,
                                    bottom: Responsive.size(context) * 0.02),
                                child: Center(
                                  child: Text('Tại bàn',
                                      style: TextStyleClass(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          .textStyleMedium(context)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Responsive.size(context) * 0.02,
                            ),
                            ElevatedButton(
                              //enabled: false,
                              onPressed: () {
                                //TODO:Hình thức đặt đơn
                              },
                              style: ButtonStyle(
                                backgroundColor: !selected
                                    ? MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 175, 14, 2))
                                    : MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(
                                            255, 200, 197, 197)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: Responsive.size(context) * 0.02,
                                    bottom: Responsive.size(context) * 0.02),
                                child: Center(
                                  child: Text('Mang về',
                                      style: TextStyleClass(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)
                                          .textStyleMedium(context)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.note_alt_outlined,
                        color: Colors.blue,
                        size: Responsive.size(context) * 0.06,
                      ),
                      hintText: 'Ghi chú',
                      hintStyle: TextStyleClass(
                              fontWeight: FontWeight.w500, color: Colors.grey)
                          .textStyleSmall(context),
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.all(
                      //   Resize.size(context) * 0.01,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Responsive.size(context) * 0.025),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      Responsive.size(context) * 0.03,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tạm tính",
                              style: TextStyleClass(fontWeight: FontWeight.bold)
                                  .textStyleMedium(context),
                            ),
                            Text(
                              "100.000đ",
                              style: TextStyleClass(fontWeight: FontWeight.bold)
                                  .textStyleMedium(context),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phí áp dung: ",
                              style: TextStyleClass().textStyleMedium(context),
                            ),
                            Text(
                              "29.000",
                              style: TextStyleClass().textStyleMedium(context),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ưu đãi: ",
                              style: TextStyleClass(
                                      color:
                                          const Color.fromARGB(255, 4, 152, 9))
                                  .textStyleMedium(context),
                            ),
                            Text(
                              "-29.000",
                              style: TextStyleClass(
                                      color:
                                          const Color.fromARGB(255, 4, 152, 9))
                                  .textStyleMedium(context),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ưu đãi: ",
                              style: TextStyleClass(
                                      color:
                                          const Color.fromARGB(255, 4, 152, 9))
                                  .textStyleMedium(context),
                            ),
                            Text(
                              "-15.000",
                              style: TextStyleClass(
                                      color:
                                          const Color.fromARGB(255, 4, 152, 9))
                                  .textStyleMedium(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: Responsive.size(context) * 0.01),
                            child: Icon(
                              Icons.discount_outlined,
                              color: const Color.fromARGB(255, 162, 12, 2),
                              size: Responsive.size(context) * 0.06,
                            ),
                          ),
                          SizedBox(
                            width: Responsive.size(context) * 0.02,
                          ),
                          Text(
                            'Đã áp 3 mã giảm giá',
                            style: TextStyleClass(fontWeight: FontWeight.w500)
                                .textStyleSmall(context),
                            maxLines: 4,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                            size: Responsive.size(context) * 0.03,
                          )),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: Responsive.size(context) * 0.01),
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: const Color.fromARGB(255, 162, 12, 2),
                              size: Responsive.size(context) * 0.06,
                            ),
                          ),
                          SizedBox(
                            width: Responsive.size(context) * 0.02,
                          ),
                          Text(
                            'Ví Mimo',
                            style: TextStyleClass(fontWeight: FontWeight.w500)
                                .textStyleSmall(context),
                            maxLines: 4,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                            size: Responsive.size(context) * 0.03,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
