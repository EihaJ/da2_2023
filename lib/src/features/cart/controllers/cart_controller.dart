import 'package:get/get.dart';

import '../../../common_models/product.dart';

class CartController extends GetxController {
  RxMap<String, int> _cartItems = <String, int>{}.obs;

  Map<String, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id] = _cartItems[product.id]! + 1;
    } else {
      _cartItems[product.id] = 1;
    }
  }

  void removeFromCart(String productId) {
    _cartItems.remove(productId);
  }

  double calculateTotalPrice(List<Product> products) {
    double totalPrice = 0.0;
    for (var entry in _cartItems.entries) {
      String productId = entry.key;
      int quantity = entry.value;
      Product product = products.firstWhere((p) => p.id == productId);
      totalPrice += product.price * quantity;
    }
    return totalPrice;
  }

  void updateProductQuantity(String productId, int quantity) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = quantity;
    }
  }
}
