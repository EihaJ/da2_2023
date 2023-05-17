// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Hide the appBar in LoginScreen
      body:  SafeArea(
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
                          Get.offAndToNamed("/");
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
                              'Homepage',
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
                        'LOGIN',
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
                      Row(
                        children: [
                          Text(
                            'Do not have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/sign_up');
                            },
                            child: Text(
                              'Register Here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                            ),
                          ),
                        ],
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

                      const SizedBox(height: 20.0),
                      CustomTextField(
                        onChanged: (value) => setState(() => _password = value),
                        labelText: 'Password',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                        obscureText: true,
                      ),
                      const SizedBox(height: 5.0),
                      TextButton(
                        //Connect to Forgot Password
                        onPressed: () {
                          Get.toNamed('/forgot_password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      CTAButton(
                        onPressed: () {
                          print('login success');
                        },
                        text: "LOGIN",
                        buttonType: ButtonType.secondary,
                        buttonWidth: ButtonWidth.fill,
                      ),
                      const SizedBox(height: 8.0),
                      InkResponse(
                        splashColor: Colors.transparent,
                        enableFeedback: false,

                        //Log in using google
                        onTap: () {},
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: PrimaryColor2,
                            border: Border.all(),
                          ),
                          child: Center(
                              child: Image.asset(
                            google_logo,
                            height: 24,
                            width: 24,
                          )),
                        ),
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
