// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

import '../sign_up/sign_up.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late String _newPassword;
  late String _confirmNewPassword;

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
                          'NEW PASSWORD',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'Input your new password',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextField(
                          onChanged: (value) =>
                              setState(() => _newPassword = value),
                          labelText: 'New password',
                          textFieldType: TextFieldType.white,
                          textFieldWidth: TextFieldWidth.fill,
                          obscureText: true,
                        ),

                        const SizedBox(height: 20.0),
                        CustomTextField(
                          onChanged: (value) =>
                              setState(() => _confirmNewPassword = value),
                          labelText: 'Confirm new password',
                          textFieldType: TextFieldType.white,
                          textFieldWidth: TextFieldWidth.fill,
                          obscureText: true,
                        ),

                        const SizedBox(height: 40.0),
                        CTAButton(
                          onPressed: () {
                            //Move to Login page with credential
                            print('Change password success');
                          },
                          text: "SAVE & LOGIN",
                          buttonType: ButtonType.secondary,
                          buttonWidth: ButtonWidth.fill,
                        ),
                        const SizedBox(height: 8.0),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
