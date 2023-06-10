// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text_field.dart';
import '../../../constants/colors.dart';

import '../controllers/search_controller.dart';

import '../widgets/search_tile.dart';

class SearchScreen extends StatelessWidget {
  final controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: PrimaryColor2,
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 480,
        height: 600,
        child: Column(
          children: [
            TextField(
              onChanged: controller.search,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: PrimaryColor1.withOpacity(0.7),
                ),
                hintText: 'Search...',
                hintStyle: Theme.of(context).textTheme.bodyText1,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Obx(
                () => ListView(
                  children: controller.filteredProducts
                      .map(
                        (product) => SearchTile(product),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
