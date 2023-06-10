import 'package:get/get.dart';

import '../../../common_models/product.dart';

class CartController extends GetxController {
  RxMap<String, int> _cartItems = <String, int>{}.obs;

  Map<String, int> get cartItems => _cartItems;

  void addToCart(ProductFirebase product) {
    if (_cartItems.containsKey(product.uid)) {
      _cartItems[product.uid] = _cartItems[product.uid]! + 1;
    } else {
      _cartItems[product.uid] = 1;
    }
  }

  void removeFromCart(String productId) {
    _cartItems.remove(productId);
  }

  double calculateTotalPrice(List<ProductFirebase> products) {
    double totalPrice = 0.0;
    for (var entry in _cartItems.entries) {
      String productId = entry.key;
      int quantity = entry.value;
      ProductFirebase product = products.firstWhere((p) => p.uid == productId);
      // totalPrice += product.price * quantity;
    }
    return totalPrice;
  }

  void updateProductQuantity(String productId, int quantity) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = quantity;
    }
  }
}
