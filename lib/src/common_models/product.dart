import 'package:cloud_firestore/cloud_firestore.dart';

//MODEL FOR FIREBASE VERSION
class ProductFirebase {
  String uid;
  String productName;
  String version;
  String brand;
  double price;
  String description;
  String image;
  String artist;
  List<String> tags;

  ProductFirebase({
    required this.uid,
    required this.productName,
    required this.version,
    required this.brand,
    required this.price,
    required this.description,
    required this.image,
    required this.artist,
    this.tags = const [],
  });

  factory ProductFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {}; // Set default value for nullable data
    try {
      return ProductFirebase(
        uid: uid,
        productName: data['productName'] ?? '',
        brand: data['brand'] ?? '',
        version: data['version'] ?? '',
        price: (data['price'] ?? 0.0).toDouble(),
        description: data['description'] ?? '',
        image: data['image'] ?? '',
        artist: data['artist'] ?? '',
        tags: List<String>.from(data['tags'] ?? []),
      );
    } catch (e) {
      // Handle the error here
      print('Error creating Product from snapshot: $e');
      // Return a default Product or throw the error if desired
      return ProductFirebase(
        uid: uid,
        productName: '',
        brand: '',
        version: '',
        price: 0.0,
        description: '',
        image: '',
        artist: '',
        tags: [],
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'productName': productName,
      'brand': brand,
      'version': version,
      'price': price,
      'description': description,
      'image': image,
      'artist': artist,
      'tags': tags,
    };
  }

  Future<void> create() async {
    final collection = FirebaseFirestore.instance.collection('products');
    await collection.doc(uid).set(toMap()); 
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('products');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('products');
    await collection.doc(uid).delete();
  }

  static Stream<List<ProductFirebase>> getAllProducts() {
    final collection = FirebaseFirestore.instance.collection('products');
    return collection.snapshots().map(
      (querySnapshot) => querySnapshot.docs
          .map((doc) => ProductFirebase.fromSnapshot(doc.data(), doc.id))
          .toList(),
    );
  }

  static Future<ProductFirebase?> getProductById(String productId) async {
    final collection = FirebaseFirestore.instance.collection('products');
    final snapshot = await collection.doc(productId).get();
    if (snapshot.exists) {
      return ProductFirebase.fromSnapshot(snapshot.data(), snapshot.id);
    } else {
      return null;
    }
  }
}

// MODEL FOR TESTING VERSION
class Product {
  final String id;
  String productName;
  String version;
  String brand;
  double price;
  String description;
  String mainImage;
  String artist;
  double quantity;
  List<String> tags;

  Product({
    this.quantity = 1,
    required this.id,
    required this.productName,
    required this.version,
    required this.brand,
    required this.price,
    required this.description,
    required this.mainImage,
    required this.artist,
    this.tags = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      quantity: (json['quantity']?? 0.0).toDouble(),
      id: json['id'] ?? '',
      productName: json['productName'] ?? '',
      brand: json['brand'] ?? '',
      version: json['version'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      mainImage: json['mainImage'] ?? '',
      artist: json['artist'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'brand': brand,
      'price': price,
      'description': description,
      'mainImage': mainImage,
      'artist': artist,
      'version': version,
      'tags': tags,
    };
  }
}
