import 'package:chatapp/controllers/login_controller.dart';
import 'package:chatapp/controllers/signup_controller.dart';
import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:chatapp/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LognScreen extends StatefulWidget {
  const LognScreen({super.key});

  @override
  State<LognScreen> createState() => _LognScreenState();
}

class _LognScreenState extends State<LognScreen> {
  var userForm = GlobalKey<FormState>();
  bool islog=false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("log in "),
      ),
      body: Form(
        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "email is required";
                  }
                },
                decoration: InputDecoration(label: Text("email")),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return "email is required";
                  }
                },
                controller: password,
                obscureText: true,
                enableSuggestions: true,
                decoration: InputDecoration(label: Text("password")),
              ),
              ElevatedButton(
                  onPressed: () async{
                    if (userForm.currentState!.validate()) {
                      islog=true;
                      setState(() {
                        
                      });
                  await    logincontroller.login(
                          context: context,
                          email: email.text,
                          password: password.text);
                        islog=false;
                        setState(() {
                          
                        });  
                    }
                  },
                  child:islog?CircularProgressIndicator(): Text(" login")),
              Row(children: [
                Text("dont have an account"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignScreen();
                      }));
                    },
                    child: Text("Sign up now"))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
