import 'package:chatapp/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameText = TextEditingController();
  var db = FirebaseFirestore.instance;
  @override
  void initState() {
    nameText.text = Provider.of<UserProvider>(context, listen: false).useName;
    super.initState();
  }

  void updatedata() {
    Map<String, dynamic> dataupdateto = {"name": nameText.text};
    db
        .collection("users")
        .doc(Provider.of<UserProvider>(context, listen: false).userId)
        .update(dataupdateto);
    Provider.of<UserProvider>(context, listen: false).getdata();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var user_provider = Provider.of<UserProvider>(context);
    var editform = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text("edit profile"),
          actions: [
            InkWell(
              onTap: () {
                if (editform.currentState!.validate()) {
                  updatedata();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.check),
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: editform,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "name cannot empty";
                      }
                    },
                    controller: nameText,
                    decoration: InputDecoration(label: Text("name")),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
