import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'version.dart';

class ProductFirebase {
  String uid;
  String image;
  String productName;
  String artist;
  String brand;
  bool featured;
  List<ProductVersion> versions;
  String description;
  List<String> tags;
  double sale;
  int numberVersion;
  String shippingPolicy;
  String returnPolicy;
  String shippingPolicyID;
  String returnPolicyID;
  String changedTime;

  ProductFirebase({
    String? uid,
    required this.productName,
    this.versions = const [],
    required this.brand,
    required this.description,
    required this.image,
    required this.artist,
    required this.featured,
    required this.numberVersion,
    required this.returnPolicy,
    required this.shippingPolicy,
    required this.returnPolicyID,
    required this.shippingPolicyID,
    this.tags = const [],
    required this.sale,
    required this.changedTime,
  }) : uid = uid ?? generateUid();

  factory ProductFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return ProductFirebase(
        uid: uid,
        productName: data['productName'] ?? '',
        brand: data['brand'] ?? '',
        versions: List<ProductVersion>.from(
            (data['versions'] ?? []).map((v) => ProductVersion.fromMap(v))),
        description: data['description'] ?? '',
        image: data['image'] ?? '',
        featured: data['featured'] ?? false,
        artist: data['artist'] ?? '',
        tags: List<String>.from(data['tags'] ?? []),
        sale: data['sale'] ?? 0.0,
        numberVersion: data['numberVersion'] ?? 0.0,
        returnPolicy: data['returnPolicy'] ?? '',
        shippingPolicy: data['shippingPolicy'] ?? '',
        returnPolicyID: data['returnPolicyID'] ?? '',
        shippingPolicyID: data['shippingPolicyID'] ?? '',
        changedTime: data['changedTime'] ?? '',
      );
    } catch (e) {
      print('Error creating Product from snapshot: $e');
      return ProductFirebase(
        uid: uid,
        productName: '',
        brand: '',
        versions: [],
        description: '',
        featured: false,
        image: '',
        artist: '',
        tags: [],
        sale: 0.0,
        numberVersion: 0,
        returnPolicy: '',
        shippingPolicy: '',
        returnPolicyID: '',
        shippingPolicyID: '',
        changedTime: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'productName': productName,
      'brand': brand,
      'versions': versions.map((v) => v.toMap()).toList(),
      'description': description,
      'image': image,
      'artist': artist,
      'tags': tags,
      'featured': featured,
      'sale': sale,
      'numberVersion': numberVersion,
      'returnPolicy': returnPolicy,
      'shippingPolicy': shippingPolicy,
      'returnPolicyID': returnPolicyID,
      'shippingPolicyID': shippingPolicyID,
      'changedTime': changedTime,
    };
  }

  Future<void> create() async {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    await productsCollection.doc(uid).set(toMap());
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('products');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('products');
    await collection.doc(uid).delete();
  }

  static Stream<List<ProductFirebase>> getAllProducts(
      {String? productNameFilter, String? brandNameFilter}) {
    final collection = FirebaseFirestore.instance.collection('products');

    final collectionWithBrandFilter = FirebaseFirestore.instance
        .collection('products')
        .where('brand', isEqualTo: brandNameFilter);

    if (brandNameFilter != null && brandNameFilter.isNotEmpty) {
      return collectionWithBrandFilter.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => ProductFirebase.fromSnapshot(doc.data(), doc.id))
                .toList(),
          );
    }
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

  static String generateUid() {
    final Uuid uuid = Uuid();
    return uuid.v4();
  }
}
