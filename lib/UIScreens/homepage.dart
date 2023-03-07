import 'package:flutter/material.dart';
import '../components/component.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
          ],
        ),
      ),
    );
  }
}
