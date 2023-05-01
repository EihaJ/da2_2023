import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/homepage/screens/homepage.dart';

import '../features/search/screens/search.dart';

import '../features/shop/screens/shop.dart';

import '../features/about_us/screens/about_us.dart';

import '../features/blogs/screens/blog.dart';

import '../features/authentication/screens/log_in/login.dart';
import '../features/authentication/screens/sign_up/sign_up.dart';
import '../features/authentication/screens/forgot_password/forgot_password.dart';
import '../features/authentication/screens/forgot_password/otp.dart';
import '../features/authentication/screens/forgot_password/new_password.dart';
import '../features/authentication/screens/new_profile/new_profile.dart';

class AppRoutes {
  static final pages = [
    //HOMEPAGE
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),

    //LOGIN
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/sign_up',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/forgot_password',
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: '/otp',
      page: () => OTPScreen(),
    ),
    GetPage(
      name: '/new_password',
      page: () => NewPasswordScreen(),
    ),
    GetPage(
      name: '/new_profile',
      page: () => NewProfileScreen(),
    ),

    //SHOP
    GetPage(
      name: '/shop',
      page: () => ShopScreen(GlobalKey<ScaffoldState>()),
    ),
    // Get.toNamed('/shop', arguments: GlobalKey<ScaffoldState>());

    //ABOUT US
    GetPage(
      name: '/about_us',
      page: () => AboutUsScreen(GlobalKey<ScaffoldState>()),
    ),

    //BLOG
    GetPage(
      name: '/blog',
      page: () => BlogScreen(GlobalKey<ScaffoldState>()),
    ),
  ];
}
