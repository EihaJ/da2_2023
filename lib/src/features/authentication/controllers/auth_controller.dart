import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common_models/user.dart';

class AuthController extends GetxController {
  final Rx<UserFirebase?> authenticatedUser = Rx<UserFirebase?>(null);
  final RxString uid = RxString('');

  bool get isLoggedIn => authenticatedUser.value != null;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in authenticatedUser and update uid accordingly
    ever<UserFirebase?>(authenticatedUser, (user) {
      if (user != null) {
        uid.value = user.uid;
      } else {
        uid.value = '';
      }
    });
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      authenticatedUser.value = null;
      print('uid: ${uid}');
      Get.offAllNamed('/login'); // Navigate to the login screen
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserFirebase? user =
          await UserFirebase.getUserById(userCredential.user!.uid);
      if (user != null) {
        authenticatedUser.value = user;
        Get.offAndToNamed('/');
      } else {
        print("User not found");
      }
      print('uid: ${uid}');
    } catch (e) {
      print("Error logging in: $e");
    }
  }

  void signUpUpdate(UserCredential userCredential) async {
    try {
      UserFirebase? user =
          await UserFirebase.getUserById(userCredential.user!.uid);
      if (user != null) {
        authenticatedUser.value = user;
      } else {
        print("User not found");
      }
      print('uid: ${uid}');
    } catch (e) {
      print("Error logging in: $e");
    }
  }
}
