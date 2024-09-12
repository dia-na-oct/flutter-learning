import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/splash_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signcontroller {
  static Future<void> create_account(
      {required String email,
      required String password,
      required String country,
      required BuildContext context,
      required String name}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var userid = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;
      Map<String, dynamic> data = {
        "name": name,
        "country": country,
        "email": email,
        "id": userid.toString()
      };
      try {
        db.collection("users").doc(userid.toString()).set(data);
      } catch (e) {
        print(e);
      }
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
      //  return DashScreen();
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
