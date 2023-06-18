import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'version.dart';
import 'cart_product.dart';

class CartFirebase {
  String? uid;

  List<CartProduct> cartProducts;
  String changedTime;

  CartFirebase({
    this.uid,
    required this.changedTime,
    this.cartProducts = const [],
  });

  factory CartFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return CartFirebase(
        uid: uid,
        cartProducts: List<CartProduct>.from(
            (data['cartProducts'] ?? []).map((v) => CartProduct.fromMap(v))),
        changedTime: data['changedTime'] ?? '',
      );
    } catch (e) {
      print('Error creating Product from snapshot: $e');
      return CartFirebase(
        uid: uid,
        cartProducts: [],
        changedTime: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'cartProducts': cartProducts.map((v) => v.toMap()).toList(),
      'changedTime': changedTime,
    };
  }

  Future<CartFirebase> create() async {
    final CollectionReference cartsCollection =
        FirebaseFirestore.instance.collection('carts');
    await cartsCollection.doc(uid).set(toMap());
    return this; // Return the created cart
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('carts');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('carts');
    await collection.doc(uid).delete();
  }

  static Stream<List<CartFirebase>> getAllCarts(
      {String? productNameFilter, String? brandNameFilter}) {
    final collection = FirebaseFirestore.instance.collection('carts');

    final collectionWithBrandFilter = FirebaseFirestore.instance
        .collection('carts')
        .where('brand', isEqualTo: brandNameFilter);

    if (brandNameFilter != null && brandNameFilter.isNotEmpty) {
      return collectionWithBrandFilter.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => CartFirebase.fromSnapshot(doc.data(), doc.id))
                .toList(),
          );
    }
    return collection.snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => CartFirebase.fromSnapshot(doc.data(), doc.id))
              .toList(),
        );
  }

  static Future<CartFirebase?> getCartByUserUID(String userUID) async {
  final collection = FirebaseFirestore.instance.collection('carts');
  final query = collection.where('uid', isEqualTo: userUID);
  final snapshot = await query.get();
  if (snapshot.docs.isNotEmpty) {
    final cartData = snapshot.docs.first.data();
    final cartId = snapshot.docs.first.id;
    return CartFirebase.fromSnapshot(cartData, cartId);
  } else {
    return null;
  }
}

}
