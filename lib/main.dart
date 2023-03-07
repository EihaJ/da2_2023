import 'package:flutter/material.dart';
import 'UIScreens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFF121212),
        hoverColor: Color(0xFFF5F5F5),
        fontFamily: 'Inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w300,
            letterSpacing: 2.5,
            color: Color(0xFF121212),
          ),
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Color(0xFF3D3D3D),
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Color(0xFF121212),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF121212),
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3D3D3D),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF121212),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF3D3D3D),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
