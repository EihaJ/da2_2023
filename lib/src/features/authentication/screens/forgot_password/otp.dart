import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';

import '../../../../common_widgets/text_field.dart';
import '../../../../common_widgets/cta_button.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String _otp1;
  late String _otp2;
  late String _otp3;
  late String _otp4;

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
                              'Forgot Password',
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
                        'ENTER OTP',
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
                        'Please enter the OTP that has been sent to your mail.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      //OTP Field
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            onChanged: (value) =>
                                setState(() => _otp1 = value),
                            textFieldType: TextFieldType.white,
                            width: 96,
                          ),
                          CustomTextField(
                            onChanged: (value) =>
                                setState(() => _otp2 = value),
                            textFieldType: TextFieldType.white,
                            width: 96,
                          ),
                          CustomTextField(
                            onChanged: (value) =>
                                setState(() => _otp3 = value),
                            textFieldType: TextFieldType.white,
                            width: 96,
                          ),
                          CustomTextField(
                            onChanged: (value) =>
                                setState(() => _otp4 = value),
                            textFieldType: TextFieldType.white,
                            width: 96,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed("/otp");
                          print("Resend OTP");
                          //Resend the OTP
                        },
                        child: Text(
                          'Resend OTP',
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
                          Get.toNamed("/new_password");
                          print('OTP Confirmed');
                        },
                        text: "CONFIRM OTP",
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
