import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartModel cartModel = CartModel();

  void addToCart(CartItem item) {
    cartModel.addToCart(item);
  }

  void removeFromCart(CartItem item) {
    cartModel.removeFromCart(item);
  }

  double get total {
    return cartModel.total;
  }

  void checkout() {
    // perform checkout logic here
    cartModel.clear();
  }
}
