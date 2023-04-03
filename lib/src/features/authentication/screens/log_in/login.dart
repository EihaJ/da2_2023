import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../common_widgets/CTAbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;

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
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //BackToHomepage
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [Icon(Icons.arrow_back_outlined)],
                        ),
                      ),
      
                      //Title
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
                            onPressed: () {},
                            child: Text(
                              'Register Here',
                              style:
                                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                      ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) => setState(() => _email = value),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (value) => setState(() => _password = value),
                      ),
                      SizedBox(height: 5.0),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      CTAButton(
                        onPressed: () {
                          print('login success');
                        },
                        text: "Login",
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
