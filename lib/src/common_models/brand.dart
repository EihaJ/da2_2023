import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandFirebase {
  String uid;
  String brandName;

  BrandFirebase({
    String? uid,
    required this.brandName,
  }) : uid = uid ?? generateUid();

  factory BrandFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return BrandFirebase(
        uid: uid,
        brandName: data['brandName'] ?? '',
      );
    } catch (e) {
      print('Error creating Brand from snapshot: $e');
      return BrandFirebase(
        uid: uid,
        brandName: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'brandName': brandName,
    };
  }

  Future<void> create() async {
    final collection = FirebaseFirestore.instance.collection('brands');
    await collection.doc(uid).set(toMap());
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('brands');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('brands');
    await collection.doc(uid).delete();
  }

  static Stream<List<BrandFirebase>> getAllbrands() {
    final collection = FirebaseFirestore.instance.collection('brands');
    return collection.snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => BrandFirebase.fromSnapshot(doc.data(), doc.id))
              .toList(),
        );
  }

  static Future<BrandFirebase?> getProductById(String productId) async {
    final collection = FirebaseFirestore.instance.collection('brands');
    final snapshot = await collection.doc(productId).get();
    if (snapshot.exists) {
      return BrandFirebase.fromSnapshot(snapshot.data(), snapshot.id);
    } else {
      return null;
    }
  }

  static String generateUid() {
    final Uuid uuid = Uuid();
    return uuid.v4();
  }
}
