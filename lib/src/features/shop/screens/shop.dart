import 'package:flutter/material.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';

class ShopScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ShopScreen(this.scaffoldKey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(
        scaffoldKey: scaffoldKey,
      ),
      endDrawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO: Footer
              WebsiteFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
