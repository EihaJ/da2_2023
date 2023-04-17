import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Text('Cart'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: cartController.cartModel.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title:
                          Text(cartController.cartModel.cartItems[index].name),
                      trailing: Text(
                          '\$${cartController.cartModel.cartItems[index].price}'),
                    );
                  },
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                cartController.checkout();
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
