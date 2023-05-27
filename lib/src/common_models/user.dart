import 'package:cloud_firestore/cloud_firestore.dart';

//MODEL FOR FIREBASE VERSION
// class User {
//   final String id;
//   String name;
//   int age;
//   String avatarImageLink;
//   List<String> addresses;
//   String phoneNumber;
//   String emailAddress;
//   String password;

//   User({
//     required this.id,
//     required this.name,
//     required this.age,
//     required this.avatarImageLink,
//     required this.addresses,
//     required this.phoneNumber,
//     required this.emailAddress,
//     required this.password,
//   });

//   factory User.fromSnapshot(Map<String, dynamic>? data, String id) {
//     data ??= {}; // Set default value for nullable data
//     try {
//       return User(
//         id: id,
//         name: data['name'] ?? '',
//         age: data['age'] ?? 0,
//         avatarImageLink: data['avatarImageLink'] ?? '',
//         addresses: List<String>.from(data['addresses'] ?? []),
//         phoneNumber: data['phoneNumber'] ?? '',
//         emailAddress: data['emailAddress'] ?? '',
//         password: data['password'] ?? '',
//       );
//     } catch (e) {
//       // Handle the error here
//       print('Error creating User from snapshot: $e');
//       // Return a default User or throw the error if desired
//       return User(
//         id: id,
//         name: '',
//         age: 0,
//         avatarImageLink: '',
//         addresses: [],
//         phoneNumber: '',
//         emailAddress: '',
//         password: '',
//       );
//     }
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'age': age,
//       'avatarImageLink': avatarImageLink,
//       'addresses': addresses,
//       'phoneNumber': phoneNumber,
//       'emailAddress': emailAddress,
//       'password': password,
//     };
//   }

//   Future<void> create() async {
//     final collection = FirebaseFirestore.instance.collection('users');
//     await collection.doc(id).set(toMap());
//   }

//   Future<void> update() async {
//     final collection = FirebaseFirestore.instance.collection('users');
//     await collection.doc(id).update(toMap());
//   }

//   Future<void> delete() async {
//     final collection = FirebaseFirestore.instance.collection('users');
//     await collection.doc(id).delete();
//   }

//   static Stream<List<User>> getAllUsers() {
//     final collection = FirebaseFirestore.instance.collection('users');
//     return collection.snapshots().map(
//       (querySnapshot) => querySnapshot.docs
//           .map((doc) => User.fromSnapshot(doc.data(), doc.id))
//           .toList(),
//     );
//   }

//   static Future<User?> getUserById(String userId) async {
//     final collection = FirebaseFirestore.instance.collection('users');
//     final snapshot = await collection.doc(userId).get();
//     if (snapshot.exists) {
//       return User.fromSnapshot(snapshot.data(), snapshot.id);
//     } else {
//       return null;
//     }
//   }
// }

//MODEL FOR TESTING VERSION
class User {
  final String id;
  String name;
  int age;
  String avatarImageLink;
  List<String> addresses;
  String phoneNumber;
  String emailAddress;
  String password;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.avatarImageLink,
    required this.addresses,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      avatarImageLink: json['avatarImageLink'] ?? '',
      addresses: List<String>.from(json['addresses'] ?? []),
      phoneNumber: json['phoneNumber'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'avatarImageLink': avatarImageLink,
      'addresses': addresses,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
    };
  }
}