// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common_models/user.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find();
  RxString _email = ''.obs;
  RxString _password = ''.obs;

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
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 72.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed("/");
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
                      Text(
                        'LOGIN',
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w500,
                                ),
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
                        onChanged: (value) =>
                            setState(() => _email.value = value),
                        labelText: 'Email',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextField(
                        onChanged: (value) =>
                            setState(() => _password.value = value),
                        labelText: 'Password',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                        obscureText: true,
                      ),
                      const SizedBox(height: 12.0),
                      TextButton(
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
                      const SizedBox(height: 32.0),
                      CTAButton(
                        onPressed: () {
                          _authController.loginWithEmailAndPassword(
                              _email.value, _password.value);
                        },
                        text: "LOGIN",
                        buttonType: ButtonType.secondary,
                        buttonWidth: ButtonWidth.fill,
                      ),
                      const SizedBox(height: 8.0),
                      InkResponse(
                        splashColor: Colors.transparent,
                        enableFeedback: false,
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
                            ),
                          ),
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
