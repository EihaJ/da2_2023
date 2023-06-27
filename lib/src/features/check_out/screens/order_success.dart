import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_models/cart.dart';
import '../../authentication/controllers/auth_controller.dart';

class OrderConfirmationPopup extends StatefulWidget {
  String? userName;
  String? numberOrder;
  String? price;

  OrderConfirmationPopup(this.numberOrder, this.price, this.userName);

  @override
  State<OrderConfirmationPopup> createState() => _OrderConfirmationPopupState();
}

class _OrderConfirmationPopupState extends State<OrderConfirmationPopup> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Order Success'),
      content: Text(
          '${widget.userName}, you have ordered ${widget.numberOrder} items for \$${widget.price} has been placed successful!'),
      actions: [
        TextButton(
          onPressed: () async {
            final cart = await CartFirebase.getCartByUserUID(
                _authController.uid.toString());
            cart!.cartProducts.clear();
            await cart.update();
            Get.offAndToNamed('/');
          },
          child: Text('Return to Homepage'),
        ),
      ],
    );
  }
}
