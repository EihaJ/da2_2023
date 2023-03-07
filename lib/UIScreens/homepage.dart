import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/herobanner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            SingleChildScrollView(
              child: Column(
                children: [
                  HeroBanner(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
