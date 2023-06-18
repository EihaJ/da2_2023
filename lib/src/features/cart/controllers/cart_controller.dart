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

  void addToCart(ProductFirebase product, String version) {
    final userUID = _authController.uid;
    final cartItemKey =
        '$userUID|${product.uid}'; // Combine user UID and product UID as the key
    if (!_cartItems.containsKey(cartItemKey)) {
      _cartItems[cartItemKey] = <String, int>{};
    }
    if (!_cartItems[cartItemKey]!.containsKey(version)) {
      _cartItems[cartItemKey]![version] = 0;
    }
    _cartItems[cartItemKey]![version] = _cartItems[cartItemKey]![version]! + 1;
  }

  void removeFromCart(String productUID, String version) {
    final userUID = _authController.uid;
    final cartItemKey =
        '$userUID|$productUID'; // Combine user UID and product UID as the key
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
