import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/providers/user_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user=FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if(user==null){
      openlog();

      }else{
        opndash();
      }
    });
    super.initState();
  }

  void opndash() {
    Provider.of<UserProvider>(context, listen: false).getdata();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DashScreen();
    }));
  }

  void openlog() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LognScreen();
    }));
  }

  void opensign() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignScreen();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("splash")),
    );
  }
}
