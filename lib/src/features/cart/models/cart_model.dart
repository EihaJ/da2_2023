import 'package:get/get.dart';

class CartModel {
  final RxList<CartItem> cartItems = RxList<CartItem>();

  void addToCart(CartItem item) {
    cartItems.add(item);
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  double get total {
    double total = 0.0;
    cartItems.forEach((item) {
      total += item.price;
    });
    return total;
  }

  void clear() {
    cartItems.clear();
  }
}

class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}
