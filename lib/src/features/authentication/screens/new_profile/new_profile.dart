// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

import '../sign_up/sign_up.dart';

class NewProfileScreen extends StatefulWidget {
  final String userId;
  NewProfileScreen({required this.userId});
  @override
  _NewProfileScreenState createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  late String _username;
  late String _address;

  List<String> avtList = [avt1, avt2, avt3, avt4, avt5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              authBG,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.6),
                ),
                height: 650,
                width: 500,
                child: Padding(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 72.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //BackToHomepage
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed("/login");
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(
                              Icons.arrow_back_outlined,
                              color: PrimaryColor2,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 14,
                                color: PrimaryColor2,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      //Title
                      Text(
                        'CREATE PROFILE',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                color: Color(0xFFF5F5F5),
                                fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Center(
                        child: Stack(
                          children: [
                            //
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                avtList[Random().nextInt(avtList.length)],
                                width: 160,
                                height: 160,
                              ),
                            ),

                            Positioned(
                              top: 1,
                              right: 1,
                              child: IconButton(
                                onPressed: () {
                                  //Change avt image
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: PrimaryColor2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add Avatar choose

                      const SizedBox(height: 20.0),
                      CustomTextField(
                        onChanged: (value) => setState(() => _username = value),
                        labelText: 'Username',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                      ),

                      CustomTextField(
                        onChanged: (value) => setState(() => _address = value),
                        labelText: 'Address',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                      ),

                      const SizedBox(height: 40.0),
                      CTAButton(
                        onPressed: () {
                          print('create profile success');
                        },
                        text: "SAVE & LOGIN",
                        buttonType: ButtonType.secondary,
                        buttonWidth: ButtonWidth.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
