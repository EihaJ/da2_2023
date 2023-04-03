import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'src/utilities/theme.dart';

import 'src/features/homepage/screens/homepage.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WebTheme.lightTheme,
      home: HomePage(),
    );
  }
}
