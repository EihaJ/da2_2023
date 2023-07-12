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
      title: Text(
        'ORDER SUCCESS',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.black),
      ),
      content: Text(
        '${widget.userName}, you have success ordered ${widget.numberOrder} items for \$${widget.price}!',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final cart = await CartFirebase.getCartByUserUID(
                _authController.uid.toString());
            cart!.cartProducts.clear();
            await cart.update();
            Get.offAndToNamed('/');
          },
          child: Text(
            'Return to Homepage',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
