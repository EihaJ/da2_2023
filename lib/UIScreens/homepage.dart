import 'package:flutter/material.dart';
import '../components/CTAbutton.dart';
import '../components/appbar.dart';
import '../components/herobanner.dart';
import '../components/productshowcase.dart';
import '../components/categories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Padding(
                padding: EdgeInsetsDirectional.all(20),
              ),
              CategoriesScreens(),
              Padding(padding: EdgeInsetsDirectional.all(60)),
              Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FAsset%202.png?alt=media&token=eb4e4598-6aca-480e-aa37-fe17db532a9d')
            ],
          ),
        ),
      ),
    );
  }
}
