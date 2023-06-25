import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'version.dart';
import 'cart_product.dart';

class OrderFirebase {
  String uid;
  String userUID;
  String userName;
  String userPhoneNumber;
  String address;
  String orderTime;
  String paymentType;
  double totalPrice;
  String status;
  List<CartProduct> cartProducts;

  OrderFirebase({
    String? uid,
    required this.userUID,
    required this.userName,
    required this.userPhoneNumber,
    required this.address,
    required this.orderTime,
    required this.paymentType,
    required this.totalPrice,
    required this.status,
    this.cartProducts = const [],
  }) : uid = uid ?? generateUid();

  factory OrderFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return OrderFirebase(
        uid: uid,
        userUID: data['userUID'] ?? '',
        userName: data['userName'] ?? '',
        userPhoneNumber: data['usePhoneNumber'] ?? '',
        address: data['address'] ?? '',
        orderTime: data['orderTime'] ?? '',
        totalPrice: data['totalPrice'] ?? 0.0,
        paymentType: data['paymentType'] ?? '',
        status: data['status'] ?? 'Error',
        cartProducts: List<CartProduct>.from(
            (data['cartProducts'] ?? []).map((v) => CartProduct.fromMap(v))),
      );
    } catch (e) {
      print('Error creating Product from snapshot: $e');
      return OrderFirebase(
        uid: uid,
        userUID: '',
        userName: '',
        userPhoneNumber: '',
        address: '',
        orderTime: '',
        totalPrice: 0.0,
        paymentType: '',
        status: 'Error',
        cartProducts: [],
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userUID': userUID,
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'address': address,
      'orderTime': orderTime,
      'totalPrice': totalPrice,
      'paymentType': paymentType,
      'status': status,
      'cartProducts': cartProducts.map((v) => v.toMap()).toList(),
    };
  }

  Future<void> create() async {
    final CollectionReference ordersCollection =
        FirebaseFirestore.instance.collection('orders');
    await ordersCollection.doc(uid).set(toMap());
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('orders');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('orders');
    await collection.doc(uid).delete();
  }

  static Stream<List<OrderFirebase>> getAllOrders() {
    final collection = FirebaseFirestore.instance.collection('orders');

    return collection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((doc) => OrderFirebase.fromSnapshot(doc.data(), doc.id))
        .toList());
  }

  static Future<OrderFirebase?> getOrderById(String orderId) async {
    final collection = FirebaseFirestore.instance.collection('orders');
    final snapshot = await collection.doc(orderId).get();
    if (snapshot.exists) {
      return OrderFirebase.fromSnapshot(snapshot.data(), snapshot.id);
    } else {
      return null;
    }
  }

  static String generateUid() {
    final Uuid uuid = Uuid();
    return uuid.v4();
  }
}
