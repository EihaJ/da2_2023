import 'package:cloud_firestore/cloud_firestore.dart';

// MODEL FOR FIREBASE VERSION
import 'package:firebase_auth/firebase_auth.dart';

class UserFirebase {
  String uid;
  String name;
  String role = 'user';
  int age;
  String avatarImageLink;
  List<String> addresses;
  String phoneNumber;
  String emailAddress;
  String password;
  int addressNumber;

  UserFirebase({
    required this.uid,
    required this.name,
    required this.role,
    required this.age,
    required this.avatarImageLink,
    required this.addresses,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
    required this.addressNumber,
  });

  factory UserFirebase.fromSnapshot(Map<String, dynamic>? data, String uid) {
    data ??= {}; // Set default value for nullable data
    try {
      return UserFirebase(
        uid: uid,
        name: data['name'] ?? '',
        role: data['role'],
        age: data['age'] ?? 0,
        avatarImageLink: data['avatarImageLink'] ?? '',
        addresses: List<String>.from(data['addresses'] ?? []),
        phoneNumber: data['phoneNumber'] ?? '',
        emailAddress: data['emailAddress'] ?? '',
        password: data['password'] ?? '',
        addressNumber: data['addressNumber'] ?? 0,
      );
    } catch (e) {
      // Handle the error here
      print('Error creating User from snapshot: $e');
      // Return a default User or throw the error if desired
      return UserFirebase(
        uid: uid,
        role: 'user',
        name: '',
        age: 0,
        avatarImageLink: '',
        addresses: [],
        phoneNumber: '',
        emailAddress: '',
        password: '',
        addressNumber: 0,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'role': role,
      'avatarImageLink': avatarImageLink,
      'addresses': addresses,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
      'addressNumber': addressNumber,
    };
  }

  Future<UserCredential> create() async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // Assign the user's uid to the UserFirebase object
      uid = userCredential.user!.uid;
      // Store user information in Firestore with the assigned uid
      await firestore.collection('users').doc(uid).set(toMap());

      return userCredential;
    } catch (e) {
      print('Error creating user: $e');
      rethrow;
    }
  }

  Future<void> update() async {
    final collection = FirebaseFirestore.instance.collection('users');
    await collection.doc(uid).update(toMap());
  }

  Future<void> delete() async {
    final collection = FirebaseFirestore.instance.collection('users');
    await collection.doc(uid).delete();
  }

  static Stream<List<UserFirebase>> getAllUsers() {
    final collection = FirebaseFirestore.instance.collection('users');
    return collection.snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => UserFirebase.fromSnapshot(doc.data(), doc.id))
              .toList(),
        );
  }

  static Future<UserFirebase?> getUserById(String uid) async {
    final collection = FirebaseFirestore.instance.collection('users');
    final snapshot = await collection.doc(uid).get();
    if (snapshot.exists) {
      return UserFirebase.fromSnapshot(snapshot.data(), snapshot.id);
    } else {
      return null;
    }
  }
}
