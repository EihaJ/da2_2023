import 'package:flutter/material.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
