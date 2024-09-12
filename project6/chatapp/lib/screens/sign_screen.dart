import 'package:chatapp/controllers/signup_controller.dart';
import 'package:chatapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in "),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
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
                            return "password is required";
                          }
                        },
                        controller: password,
                        obscureText: true,
                        enableSuggestions: true,
                        decoration: InputDecoration(label: Text("password")),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "name is required";
                          }
                        },
                        controller: name,
                        decoration: InputDecoration(label: Text("name")),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "country is required";
                          }
                        },
                        controller: country,
                        decoration: InputDecoration(label: Text("country")),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (userForm.currentState!.validate()) {
                              signcontroller.create_account(
                                  context: context,
                                  email: email.text,
                                  password: password.text,
                                  country: country.text,
                                  name: name.text);
                            }
                          },
                          child: Text(" create account "))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
