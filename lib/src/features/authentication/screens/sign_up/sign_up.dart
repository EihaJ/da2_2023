import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common_models/user.dart';
import '../../../../common_models/cart.dart';

import '../new_profile/new_profile_1.dart';

import '../../controllers/auth_controller.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String _email;
  late String _password;
  late String _confirmPassword;
  final AuthController _authController = Get.find();

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
                      // BackToHomepage
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

                      // Title
                      Text(
                        'SIGN UP',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
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
                            'Already have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Login Here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
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

                      const SizedBox(height: 20.0),
                      CustomTextField(
                        onChanged: (value) =>
                            setState(() => _confirmPassword = value),
                        labelText: 'Confirm Password',
                        textFieldType: TextFieldType.white,
                        textFieldWidth: TextFieldWidth.fill,
                        obscureText: true,
                      ),

                      const SizedBox(height: 40.0),
                      CTAButton(
                        onPressed: () async {
                          if (_password == _confirmPassword) {
                            try {
                              UserCredential userCredential =
                                  await UserFirebase(
                                role: 'user',
                                uid: '', // Remove this line
                                name: '',
                                age: 0,
                                avatarImageLink: '',
                                addresses: [],
                                phoneNumber: '',
                                emailAddress: _email,
                                password: _password,
                                addressNumber: 0,
                              ).create();

                              CartFirebase cartFirebase = await CartFirebase(
                                uid: userCredential.user?.uid,
                                changedTime:
                                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}',
                              ).create();

                              _authController.signUpUpdate(userCredential);
                              Get.offAndToNamed('/new_profile');
                            } catch (e) {
                              print('Error creating user: $e');
                              // Handle the error gracefully
                            }
                          } else {
                            print('Passwords do not match');
                          }
                        },
                        text: "SIGN UP",
                        buttonType: ButtonType.secondary,
                        buttonWidth: ButtonWidth.fill,
                      )
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
