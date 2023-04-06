// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late String _email;

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
                      //Back to login

                      InkWell(
                        onTap: () {
                          Get.back();
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
                        'RETRIEVE PASSWORD',
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
                        'Forgot your password? Let retrieve it using your mail.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        onChanged: (value) => setState(() => _email = value),
                        labelText: 'Email',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                      ),

                      const SizedBox(height: 40.0),
                      CTAButton(
                        onPressed: () {
                          Get.toNamed("/otp");
                          print('Forgot password success');
                        },
                        text: "RETRIEVE PASSWORD",
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
