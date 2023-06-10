import 'dart:html';
import 'dart:io';
import 'dart:math';
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

class NewProfile1Screen extends StatefulWidget {
  NewProfile1Screen();
  @override
  _NewProfile1ScreenState createState() => _NewProfile1ScreenState();
}

class _NewProfile1ScreenState extends State<NewProfile1Screen> {
  final AuthController _authController = Get.find();

  RxString _username = ''.obs;
  RxString _age = ''.obs;
  RxString _image = ''.obs;
  RxString _phoneNumber = ''.obs;

  List<String> avtList = [avt1, avt2, avt3, avt4, avt5];

  String _uploadedImage = '';

  void _handleImageUpload(dynamic event) async {
    final fileList = (event.target as FileUploadInputElement).files!;
    if (fileList.length > 0) {
      final file = fileList[0];
      final fileName = path.basename(file.name);
      final firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('UserImage/$fileName'); // Specify the folder name

      try {
        await firebaseStorageRef.putBlob(file);
        final downloadUrl = await firebaseStorageRef.getDownloadURL();

        setState(() {
          _uploadedImage = downloadUrl;
        });
      } catch (error) {
        print('Failed to upload image: $error');
      }
    }
  }

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
                  child: SingleChildScrollView(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: _uploadedImage == ''
                                    ? Image.asset(
                                        avtList[
                                            Random().nextInt(avtList.length)],
                                        width: 160,
                                        height: 160,
                                      )
                                    : Image.network(
                                        _uploadedImage,
                                        width: 160,
                                        height: 160,
                                      ),
                              ),
                              Positioned(
                                top: 1,
                                right: 1,
                                child: IconButton(
                                  onPressed: () {
                                    final input = FileUploadInputElement();
                                    input.accept = 'image/*';
                                    input.onChange.listen(_handleImageUpload);
                                    input.click();
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
                          onChanged: (value) =>
                              setState(() => _username.value = value),
                          labelText: 'Username',
                          textFieldType: TextFieldType.white,
                          textFieldWidth: TextFieldWidth.fill,
                        ),

                        const SizedBox(height: 20.0),
                        CustomTextField(
                          onChanged: (value) =>
                              setState(() => _age.value = value),
                          labelText: 'Age',
                          textFieldType: TextFieldType.white,
                          textFieldWidth: TextFieldWidth.fill,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          onChanged: (value) =>
                              setState(() => _phoneNumber.value = value),
                          labelText: 'Phone Number',
                          textFieldType: TextFieldType.white,
                          textFieldWidth: TextFieldWidth.fill,
                        ),
                        const SizedBox(height: 40.0),
                        CTAButton(
                          onPressed: () async {
                            UserFirebase userFirebase = UserFirebase(
                              uid: _authController.authenticatedUser.value!.uid,
                              name: _username.value,
                              role: 'user',
                              age: int.parse(_age.value),
                              avatarImageLink: _uploadedImage,
                              addresses: [],
                              phoneNumber: _phoneNumber.value,
                              emailAddress: _authController
                                  .authenticatedUser.value!.emailAddress,
                              password: _authController
                                  .authenticatedUser.value!.password,
                              addressNumber: 0,
                            );

                            try {
                              await userFirebase.update();
                              Get.toNamed('/new_profile_2');
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
}
