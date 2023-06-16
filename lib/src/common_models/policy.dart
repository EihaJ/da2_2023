import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PolicyFirebase {
  String uid;
  String policyName;
  String policyContent;
  String policyType;
  String changedTime;

  PolicyFirebase({
    String? uid,
    required this.policyName,
    required this.policyContent,
    required this.policyType,
    required this.changedTime,
  }) : uid = uid ?? generateUid();

  factory PolicyFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {};
    try {
      return PolicyFirebase(
        uid: uid,
        policyName: data['policyName'] ?? '',
        policyContent: data['policyContent'] ?? '',
        policyType: data['policyType'] ?? '',
        changedTime: data['changedTime'] ?? '',
      );
    } catch (e) {
      print('Error creating Policy from snapshot: $e');
      return PolicyFirebase(
        uid: uid,
        policyName: '',
        policyContent: '',
        policyType: '',
        changedTime: '',
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'policyName': policyName,
      'policyContent': policyContent,
      'policyType': policyType,
      'changedTime': changedTime,
    };
  }

  Future<void> create() async {
    final collection = FirebaseFirestore.instance.collection('policies');
    await collection.doc(uid).set(toMap());
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('policies');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('policies');
    await collection.doc(uid).delete();
  }

  static Stream<List<PolicyFirebase>> getAllPolicies(
      {String? policyTypeFilter, String? policyName}) {
    final collection = FirebaseFirestore.instance.collection('policies');
    final collectionWithTypeFilter = FirebaseFirestore.instance
        .collection('policies')
        .where('policyType', isEqualTo: policyTypeFilter);
    final collectionWithNameFilter = FirebaseFirestore.instance
        .collection('policies')
        .where('policyName', isEqualTo: policyName);

    if (policyTypeFilter != null && policyTypeFilter.isNotEmpty) {
      return collectionWithTypeFilter.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => PolicyFirebase.fromSnapshot(doc.data(), doc.id))
                .toList(),
          );
    } else if (policyName != null && policyName.isNotEmpty) {
      return collection.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => PolicyFirebase.fromSnapshot(doc.data(), doc.id))
                .toList(),
          );
    } else {
      return collectionWithNameFilter.snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => PolicyFirebase.fromSnapshot(doc.data(), doc.id))
                .toList(),
          );
    }
  }

  static Future<PolicyFirebase?> getPolicyById(String productId) async {
    final collection = FirebaseFirestore.instance.collection('policies');
    final snapshot = await collection.doc(productId).get();
    if (snapshot.exists) {
      return PolicyFirebase.fromSnapshot(snapshot.data(), snapshot.id);
    } else {
      return null;
    }
  }

  static String generateUid() {
    final Uuid uuid = Uuid();
    return uuid.v4();
  }
}
