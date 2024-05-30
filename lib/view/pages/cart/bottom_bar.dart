import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/app_color.dart';
import 'package:drinkapp/view/resource/responsive.dart';
import 'package:drinkapp/view/resource/text_style.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Responsive.size(context) * 0.03,
        right: Responsive.size(context) * 0.03,
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tổng tiền',
                style: TextStyleClass(
                        fontWeight: FontWeight.w500, color: Colors.white)
                    .textStyleSmall(context),
              ),
              SizedBox(
                height: Responsive.size(context) * 0.008,
              ),
              Text(
                '100.000đ',
                style: TextStyleClass(
                        fontWeight: FontWeight.w500, color: Colors.white)
                    .textStyleLarge(context),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: Responsive.size(context) * 0.05,
                right: Responsive.size(context) * 0.05,
                top: Responsive.size(context) * 0.04,
                bottom: Responsive.size(context) * 0.04,
              ),
              backgroundColor: AppColor.colorButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              //TODO: thanh toán

              // setState(() {
              //   selected = !selected;
              // });
            },
            child: Text(
              'Thanh toán',
              style: TextStyleClass(
                      fontWeight: FontWeight.w500, color: Colors.white)
                  .textStyleLarge(context),
            ),
          ),
        ],
      ),
    );
  }
}
