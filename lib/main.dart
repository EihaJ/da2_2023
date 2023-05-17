import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/utilities/theme.dart';
import 'src/routing/routing.dart';

import 'src/features/homepage/screens/homepage.dart';
import 'src/features/authentication/screens/log_in/login.dart';

import 'src/features/cart/controllers/cart_controller.dart';
import 'src/features/cart/screens/cart.dart';

import 'src/common_widgets/appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
          appId: "1:268306302168:web:44a25c21c1e116a05283ad",
          messagingSenderId: "268306302168",
          projectId: "da2-2023"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: WebTheme.lightTheme,
      defaultTransition: Transition.fadeIn,
      initialRoute: "/",
      getPages: AppRoutes.pages,
      builder: (context, child) {
        final CartController cartController = Get.find<CartController>();
        return Obx(() {
          return Scaffold(
            appBar: shouldShowAppBar(Get.currentRoute)
                ? null
                : appBar(cartController),
            endDrawer:
                cartController.isCartDrawerOpen.value ? CartDrawer() : null,
            body: child,
          );
        });
      },
    );
  }

  bool shouldShowAppBar(String currentRoute) {
    List<String> routesWithAppBar = [
      // Add other routes where the app bar should be displayed
      '/login',
      // Add more routes here if needed
    ];

    return routesWithAppBar.contains(currentRoute);
  }
}

          // apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
          // appId: "1:268306302168:web:44a25c21c1e116a05283ad",
          // messagingSenderId: "268306302168",
          // projectId: "da2-2023"));