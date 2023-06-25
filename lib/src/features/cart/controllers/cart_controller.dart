import 'package:da22023/src/common_models/cart_product.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';
import '../../../common_models/version.dart';
import '../../../common_models/cart.dart';

import '../../authentication/controllers/auth_controller.dart';

import 'package:da22023/src/common_models/cart_product.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';
import '../../../common_models/version.dart';
import '../../../common_models/cart.dart';

import '../../authentication/controllers/auth_controller.dart';

import 'package:da22023/src/common_models/cart_product.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';
import '../../../common_models/version.dart';
import '../../../common_models/cart.dart';

import '../../authentication/controllers/auth_controller.dart';

class CartController extends GetxController {
  RxMap<String, Map<String, int>> _cartItems = <String, Map<String, int>>{}.obs;

  Map<String, Map<String, int>> get cartItems => _cartItems;

  final AuthController _authController = Get.find();
  RxDouble totalPrice = 0.0.obs;


  void removeFromCart(String productUID, String version) {
    print('delete object');
    final userUID = _authController.uid;
    final cartItemKey =
        '$userUID|$productUID'; // Combine user UID and product UID as the key
    print('userUID: $userUID');
    print('cartItemKey: $cartItemKey');
    print('cartItem: $_cartItems');
    if (_cartItems.containsKey(cartItemKey)) {
      _cartItems[cartItemKey]!.remove(version);
      if (_cartItems[cartItemKey]!.isEmpty) {
        _cartItems.remove(cartItemKey);
      }
    }
  }

  void updateProductQuantity(String productUID, String version, int quantity,
      List<CartProduct> cartProducts) {
    final userUID = _authController.uid;
    final cartItemKey =
        '$userUID|$productUID'; // Combine user UID and product UID as the key

    if (_cartItems.containsKey(cartItemKey)) {
      final cartItem = _cartItems[cartItemKey]!;
      cartItem.forEach((key, value) {
        if (key == version) {
          cartItem[key] = quantity;

          // Update the amount and price of the CartProduct
          final cartProduct = cartProducts.firstWhere(
            (product) =>
                product.productUID == productUID &&
                product.versionName == version,
          );
          if (cartProduct != null) {
            cartProduct.amount = quantity.toDouble();
            cartProduct.price = quantity *
                cartProduct.price; // Assuming price is for a single quantity
          }
        }
      });
    }
  }

  double calculateTotalPrice(List<CartProduct> cartProducts) {
    double totalPrice = 0.0;
    for (var cartProduct in cartProducts) {
      totalPrice += cartProduct.price * cartProduct.amount;
    }
    return totalPrice;
  }
}
