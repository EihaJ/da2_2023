import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common_models/user.dart';


class AuthController extends GetxController {
  final Rx<UserFirebase?> authenticatedUser = Rx<UserFirebase?>(null);

  bool get isLoggedIn => authenticatedUser.value != null;

  void login(UserFirebase user) {
    authenticatedUser.value = user;
  }

  void logout() {
    authenticatedUser.value = null;
  }
}
