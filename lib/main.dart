// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/utilities/theme.dart';
import 'src/routing/routing.dart';

import 'src/features/authentication/controllers/auth_controller.dart';
import 'src/features/cart/controllers/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
        authDomain: "da2-2023.firebaseapp.com",
        databaseURL: "https://da2-2023-default-rtdb.firebaseio.com",
        projectId: "da2-2023",
        storageBucket: "da2-2023.appspot.com",
        messagingSenderId: "268306302168",
        appId: "1:268306302168:web:44a25c21c1e116a05283ad",
        measurementId: "G-87EK34Z2VE"),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(CartController());

    return GetMaterialApp(
      theme: WebTheme.lightTheme,
      defaultTransition: Transition.topLevel,
      initialRoute: "/",
      getPages: AppRoutes.pages,
      
    );
  }
}



          // apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
          // appId: "1:268306302168:web:44a25c21c1e116a05283ad",
          // messagingSenderId: "268306302168",
          // projectId: "da2-2023"));

        // apiKey: "AIzaSyAp3He4RWrIPVl5xLBIuY45Quo_14Jkr3o",
        // authDomain: "da2-2023.firebaseapp.com",
        // databaseURL: "https://da2-2023-default-rtdb.firebaseio.com",
        // projectId: "da2-2023",
        // storageBucket: "da2-2023.appspot.com",
        // messagingSenderId: "268306302168",
        // appId: "1:268306302168:web:44a25c21c1e116a05283ad",
        // measurementId: "G-87EK34Z2VE"),