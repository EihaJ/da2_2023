import 'package:da22023/UIScreens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../general_components/CTAbutton.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _db = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;

  void _submit() async {
    try {
      // Authenticate the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Retrieve the user data from Firestore
      DocumentSnapshot userDoc =
          await _db.collection('users').doc(userCredential.user?.uid).get();

      // Navigate to the home screen and pass the user data
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FAuth_BG.jpg?alt=media&token=cf606b9c-baa1-4e22-a1ff-4cd02c8f4115',
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
                      onPressed: () => print('Login success'),
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
    );
  }
}
