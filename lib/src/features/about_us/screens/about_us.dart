import 'package:da22023/src/common_widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:get/get.dart';

import '../../../constants/content_strings.dart';
import '../../../constants/image_strings.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen();

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String fileContent = '';

  @override
  void initState() {
    super.initState();
    readFile();
  }

  Future<void> readFile() async {
    final String fileContents = await rootBundle.loadString(about_us_content);
    setState(() {
      fileContent = fileContents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flex(
        direction: Axis.vertical,
        children: [
          // Body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO: Add Image
                  Image.asset(
                    about_us,
                    height: 640,
                  ),
                  const SizedBox(
                    width: 160,
                  ),
                  //Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NUON AUDIO STATION',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: 740,
                        child: Text(
                          fileContent,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    letterSpacing: 0.2,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      CTAButton(
                          onPressed: () {
                            print('shop');
                            Get.toNamed('/shop');
                          },
                          text: 'SHOP OUR PRODUCT')
                    ],
                  )
                ],
              ),
            ),
          ),

          //TODO: Footer
          WebsiteFooter(),
        ],
      ),
    );
  }
}
