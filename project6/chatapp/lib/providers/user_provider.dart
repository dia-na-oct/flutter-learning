import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String useName = "";
  String userEmail = "";
  String userId = "";

  var db = FirebaseFirestore.instance;
  // var authuser = FirebaseAuth.instance.currentUser;

  void getdata() async {
      var authuser = FirebaseAuth.instance.currentUser;

    await db.collection("users").doc(authuser!.uid).get().then((dataSnapshot) {
      useName = dataSnapshot.data()?["name"] ?? "";
      userEmail = dataSnapshot.data()?["email"] ?? "";
      userId = dataSnapshot.data()?["id"] ?? "";
      notifyListeners();
    });
  }
}
