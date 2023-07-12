import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import 'version.dart';
import 'cart_product.dart';

class OrderFirebase {
  String uid;
  String userUID;
  String userName;
  String userPhoneNumber;
  String address;
  DateTime orderTime;
  DateTime changedTime;
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
    required this.changedTime,
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
        userPhoneNumber: data['userPhoneNumber'] ?? '',
        address: data['address'] ?? '',
        orderTime: (data['orderTime'] as Timestamp).toDate(),
        changedTime: (data['changedTime'] as Timestamp).toDate(),
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
        orderTime: DateTime.now(),
        changedTime: DateTime.now(),
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
      'orderTime': Timestamp.fromDate(orderTime),
      'changedTime': Timestamp.fromDate(changedTime),
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

  static Stream<List<OrderFirebase>> getAllOrders({
    List<String>? status,
    String? dateTimeStart,
    String? dateTimeEnd,
  }) {
    final collection = FirebaseFirestore.instance.collection('orders');
    if (status != null && status.isNotEmpty) {
      final collectionWithStatusFilter = FirebaseFirestore.instance
          .collection('orders')
          .where('status', whereIn: status);

      if (dateTimeStart != null && dateTimeEnd != null) {
        final collectionWithStatusAndTimeFilter = collectionWithStatusFilter
            .where('orderTime',
                isGreaterThanOrEqualTo: _parseCustomDateTime(dateTimeStart))
            .where('orderTime',
                isLessThanOrEqualTo: _parseCustomDateTime(dateTimeEnd));
        return collectionWithStatusAndTimeFilter.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => OrderFirebase.fromSnapshot(doc.data(), doc.id))
                .toList());
      } else {
        return collectionWithStatusFilter.snapshots().map((querySnapshot) =>
            querySnapshot.docs
                .map((doc) => OrderFirebase.fromSnapshot(doc.data(), doc.id))
                .toList());
      }
    } else {
      return collection.snapshots().map((querySnapshot) => querySnapshot.docs
          .map((doc) => OrderFirebase.fromSnapshot(doc.data(), doc.id))
          .toList());
    }
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

  static DateTime _parseCustomDateTime(String? dateTimeString) {
    final parts = dateTimeString!.split('/');
    final partsYear = parts[2].split(' ');
    final partsTime = partsYear[1].split(':');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(partsYear[0]);
    final hour = int.parse(partsTime[0]);
    final minute = int.parse(partsTime[1]);

    return DateTime(year, month, day, hour, minute);
  }

  String formattedOrderTime() {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(orderTime);
  }

  String formattedChangedTime() {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(changedTime);
  }
}
