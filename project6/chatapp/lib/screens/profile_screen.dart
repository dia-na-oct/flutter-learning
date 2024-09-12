import 'package:chatapp/providers/user_provider.dart';
import 'package:chatapp/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user_provider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(user_provider.useName.isNotEmpty
                    ? user_provider.useName[0]
                    : 'U'),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                user_provider.useName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(user_provider.userEmail),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditScreen();
                    }));
                  },
                  child: Text("edit profile"))
            ],
          ),
        ));
  }
}
