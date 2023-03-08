import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/herobanner.dart';
import '../components/productshowcase.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroBanner(),
              Padding(padding: EdgeInsetsDirectional.all(60)),
              Container(
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'BEST CHOICE',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(padding: EdgeInsetsDirectional.all(10)),
              ProductShowcase(),
              Padding(padding: EdgeInsetsDirectional.all(60)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  'CATEGORIES',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
