import 'package:cloud_firestore/cloud_firestore.dart';

//MODEL FOR FIREBASE VERSION
class ProductVersion {
  String version;
  double price;
  double stock;

  ProductVersion({
    required this.version,
    required this.price,
    required this.stock,
  });

  factory ProductVersion.fromMap(Map<String, dynamic>? data) {
    data ??= {};
    try {
      return ProductVersion(
        version: data['version'] ?? '',
        price: (data['price'] ?? 0.0).toDouble(),
        stock: (data['stock'] ?? 0.0).toDouble(),
      );
    } catch (e) {
      print('Error creating Version from map: $e');
      return ProductVersion(
        version: '',
        price: 0.0,
        stock: 0.0,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'price': price,
      'stock': stock,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'price': price,
      'stock': stock,
    };
  }
}
