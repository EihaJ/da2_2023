import 'package:da22023/src/features/cart/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';

import '../../cart/controllers/cart_controller.dart';

import '../widgets/categories.dart';
import '../widgets/herobanner.dart';
import '../widgets/newsletter.dart';
import '../widgets/productshowcase.dart';
import '../widgets/reviews.dart';

class HomePage extends StatelessWidget {

 
    @override
  HomePage();
  final CartController controller = Get.find();

  Widget build(BuildContext context) {
    return SafeArea(
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
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FAsset%202.png?alt=media&token=eb4e4598-6aca-480e-aa37-fe17db532a9d',
              ),

              //TODO: Reviews section
              Padding(padding: EdgeInsetsDirectional.all(60)),
              ReviewSection(),
              Padding(padding: EdgeInsetsDirectional.all(60)),
              //TODO: Blog

              //TODO: About us

              //TODO: Newsletter
              NewsletterSection(),
              //TODO: Footer
              WebsiteFooter(),
            ],
          ),
        ));

  }
}
