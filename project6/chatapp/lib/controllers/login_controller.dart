import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/splash_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class logincontroller {
  static Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        //return DashScreen();
        return SplashScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      SnackBar message = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }
}
