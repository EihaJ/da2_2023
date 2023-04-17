// ignore_for_file: prefer_const_constructors

import 'package:da22023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text_field.dart';

import '../controllers/search_controller.dart';

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
                  color: PrimaryColor1.withOpacity(0.7
                  ),
                ),
                hintText: 'Search...',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
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
                  children: controller.filteredBooks
                      .map(
                        (book) => ListTile(
                          title: Text(book.title),
                          subtitle: Text(book.author),
                        ),
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
