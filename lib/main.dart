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
      options: const FirebaseOptions(
          apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
          appId: "1:268306302168:web:44a25c21c1e116a05283ad",
          messagingSenderId: "268306302168",
          projectId: "da2-2023"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    Get.put(YourController()); 
    return GetMaterialApp(
      theme: WebTheme.lightTheme,
      defaultTransition: Transition.topLevel,
      initialRoute: "/",
      getPages: AppRoutes.pages,
      builder: (context, child) {
        final YourController controller = Get.find<YourController>(); // Replace `YourController` with your actual controller class name

        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72), // Set the preferred size of the app bar
            child: Obx(() => appBarCustom(route: controller.currentRoute.value)), // Wrap AppBarCustom with PreferredSize
          ),
          endDrawer: CartDrawer(),
          body: child,
        );
      },
    );
  }
}

class YourController extends GetxController {
  RxString currentRoute = ''.obs;
}



          // apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
          // appId: "1:268306302168:web:44a25c21c1e116a05283ad",
          // messagingSenderId: "268306302168",
          // projectId: "da2-2023"));