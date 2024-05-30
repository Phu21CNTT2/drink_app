import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: Responsive.size(context) * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 140, 200, 249),
            Colors.white,
            Color.fromARGB(255, 140, 200, 249),
          ],
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              // TODO Xử lý khi ấn nút tìm kiếm
            },
            child: Ink(
              height: Responsive.size(context) * 0.1,
              width: MediaQuery.of(context).size.width -
                  Responsive.size(context) * 0.03,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: Responsive.size(context) * 0.02,
                    color: Colors.white,
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: Responsive.size(context) * 0.05,
                  ),
                  Text(
                    'Tìm kiếm...',
                    style: TextStyleClass().textStyleMedium(context),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.qr_code,
                      size: Responsive.size(context) * 0.05,
                    ),
                    onPressed: () {
                      // TODO Xử lý khi nhấn nút quét mã QR
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: Responsive.size(context) * 0.05,
                    ),
                    onPressed: () {
                      // TODO Xử lý khi nhấn nút chụp ảnh
                    },
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
