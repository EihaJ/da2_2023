import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String productUID;
  String productName;
  String productImage;
  String versionName;
  double price;
  double stock;
  double amount;

  CartProduct({
    required this.productUID,
    required this.productName,
    required this.productImage,
    required this.versionName,
    required this.price,
    required this.stock,
    required this.amount,
  });

  factory CartProduct.fromMap(Map<String, dynamic> data) {
    return CartProduct(
      productUID: data['productUID'] ?? '',
      productName: data['productName'] ?? '',
      productImage: data['productImage'] ?? '',
      versionName: data['versionName'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      stock: (data['stock'] ?? 0).toDouble(),
      amount: (data['amount'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productUID': productUID,
      'productName': productName,
      'productImage': productImage,
      'versionName': versionName,
      'price': price,
      'stock': stock,
      'amount': amount,
    };
  }
}
