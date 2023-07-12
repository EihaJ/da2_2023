// homepage.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../authentication/controllers/auth_controller.dart';

import '../widgets/categories.dart';
import '../widgets/herobanner.dart';
import '../widgets/newsletter.dart';
import '../widgets/productshowcase.dart';
import '../widgets/reviews.dart';

import '../../cart/screens/cart.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      endDrawer: CartDrawer(cartController: _cartController,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroBanner(),
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'BEST CHOICE',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 10),
              ProductShowcase(),
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  'CATEGORIES',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 20),
              CategoriesScreens(),
              SizedBox(height: 60),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FAsset%202.png?alt=media&token=eb4e4598-6aca-480e-aa37-fe17db532a9d',
              ),
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'RECOMMEND FOR YOU',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
                 SizedBox(height: 10),
              ReviewSection(),
              SizedBox(height: 60),
              NewsletterSection(),
              WebsiteFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
