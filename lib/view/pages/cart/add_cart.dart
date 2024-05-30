import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drinkapp/view/custom/cart/item_cart.dart';
import 'package:drinkapp/view/custom/cart/app_bar.dart';
import 'package:drinkapp/view/resource/responsive.dart';

import '../../../data_mau.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  double totalPrice = 0; // Tổng tiền
  @override
  void initState() {
    super.initState();
  }

  void calculateTotalPrice() {
    double newTotalPrice = 0;
    for (var item in items) {
      double price = item['price'];
      int quantity = item['quantity'];
      newTotalPrice += price * quantity;
    }
    setState(() {
      totalPrice = newTotalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarCustom(),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                Responsive.size(context) * 0.15,
            child: SingleChildScrollView(
              child: SizedBox(
                height: Responsive.size(context) * 0.365 * items.length +
                    Responsive.size(context) * 0.2,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = items[index];
                    if (kDebugMode) {
                      print(data);
                    }
                    return ItemAddCart(data: data);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
