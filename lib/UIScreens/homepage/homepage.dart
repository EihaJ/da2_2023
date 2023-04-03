import 'package:flutter/material.dart';
import '../../general_components/appbar.dart';
import '../../general_components/footer.dart';
import 'homepage_components/productshowcase.dart';
import 'homepage_components/categories.dart';
import 'homepage_components/herobanner.dart';
import 'homepage_components/newsletter.dart';
import 'homepage_components/reviews.dart';

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
        ),
      ),
    );
  }
}
