import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandFirebase {
  String uid;
  String brandName;
  String brandImage;
  String brandDescription;
  String changedTime;

  BrandFirebase(
      {String? uid,
      required this.brandName,
      required this.brandImage,
      required this.brandDescription,
      required this.changedTime})
      : uid = uid ?? generateUid();

  factory BrandFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return BrandFirebase(
        uid: uid,
        brandName: data['brandName'] ?? '',
        brandImage: data['brandImage'] ?? '',
        brandDescription: data['brandDescription'] ?? '',
        changedTime: data['changedTime'] ?? '',
      );
    } catch (e) {
      print('Error creating Brand from snapshot: $e');
      return BrandFirebase(
        uid: uid,
        brandName: '',
        brandImage: '',
        brandDescription: '',
        changedTime: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'brandName': brandName,
      'brandImage': brandImage,
      'brandDescription': brandDescription,
      'changedTime': changedTime,
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

  static Stream<List<BrandFirebase>> getAllBrands() {
    final collection = FirebaseFirestore.instance.collection('brands');
    return collection.snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => BrandFirebase.fromSnapshot(doc.data(), doc.id))
              .toList(),
        );
  }

  // static Stream<List<BrandFirebase>> getAllBrands({String? brandNameFilter}) {
  //   final collection = FirebaseFirestore.instance.collection('brands');
  //   final collection1 = FirebaseFirestore.instance
  //       .collection('brands')
  //       .where('brandName', isEqualTo: brandNameFilter);
  //   // Apply the filter if provided
  //   if (brandNameFilter != null && brandNameFilter.isNotEmpty) {
  //     return collection1.snapshots().map(
  //           (querySnapshot) => querySnapshot.docs
  //               .map((doc) => BrandFirebase.fromSnapshot(doc.data(), doc.id))
  //               .toList(),
  //         );
  //   } else {
  //     return collection.snapshots().map(
  //           (querySnapshot) => querySnapshot.docs
  //               .map((doc) => BrandFirebase.fromSnapshot(doc.data(), doc.id))
  //               .toList(),
  //         );
  //   }
  // }

  static Future<BrandFirebase?> getBrandById(String brandId) async {
    final collection = FirebaseFirestore.instance.collection('brands');
    final snapshot = await collection.doc(brandId).get();
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
