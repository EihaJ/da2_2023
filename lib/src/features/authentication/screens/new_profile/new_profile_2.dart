import 'package:da22023/src/common_widgets/adjust_quantity.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_models/user.dart';
import '../../controllers/auth_controller.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

import '../sign_up/sign_up.dart';

class NewProfile2Screen extends StatefulWidget {
  NewProfile2Screen();
  @override
  _NewProfile2ScreenState createState() => _NewProfile2ScreenState();
}

class _NewProfile2ScreenState extends State<NewProfile2Screen> {
  final AuthController _authController = Get.find();

  List<RxString> _address = [];
  int _addressNumber = 1;

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 72.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed("/login");
                          },
                          child: Row(
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
                        Text(
                          'CREATE PROFILE',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number of Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Color(0xFFF5F5F5),
                                      fontWeight: FontWeight.w500),
                            ),
                            AdjustableQuantity(
                              onChanged: _onNumberOfAddressChanged,
                              themeColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        ...generateAddressFields(),
                        const SizedBox(height: 40.0),
                        CTAButton(
                          onPressed: () async {
                            UserFirebase? userFirebase1 =
                                await UserFirebase.getUserById(
                                    _authController.uid.toString());
                            print(_address);
                            UserFirebase userFirebase = UserFirebase(
                              uid: _authController.authenticatedUser.value!.uid,
                              name:
                                  userFirebase1!.name,
                              role: 'user',
                              age:  userFirebase1.age,
                              avatarImageLink:  userFirebase1.avatarImageLink,
                              addresses: _address
                                  .map((address) => address.value)
                                  .toList(),
                              phoneNumber:  userFirebase1.phoneNumber,
                              emailAddress: _authController
                                  .authenticatedUser.value!.emailAddress,
                              password: _authController
                                  .authenticatedUser.value!.password,
                              addressNumber: _addressNumber,
                            );

                            try {
                              await userFirebase.update();

                              Get.offAndToNamed('/');
                            } catch (error) {
                              print(
                                  'Failed to update user information: $error');
                            }
                          },
                          text: "NEXT",
                          buttonType: ButtonType.secondary,
                          buttonWidth: ButtonWidth.fill,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateAddressFields() {
    List<Widget> fields = [];
    for (int i = 1; i <= _addressNumber; i++) {
      RxString addressName = ''.obs;
      _address.add(addressName);
      fields.add(
        Column(
          children: [
            CustomTextField(
              onChanged: (value) {
                addressName.value = value;
              },
              labelText: 'Address $i Name',
              textFieldWidth: TextFieldWidth.fill,
              textFieldType: TextFieldType.white,
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      );
    }
    return fields;
  }

  void _onNumberOfAddressChanged(int value) {
    setState(() {
      _addressNumber = value;
    });
  }
}
