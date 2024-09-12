import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfact/screens/settings.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<dynamic> facts = [];
  void getdata() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/clipvibe/flutter_dummy_api/main/facts.json");
      facts = jsonDecode(response.data);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fun facts "),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: facts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          facts[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("swip left for more"),
          ))
        ],
      ),
    );
  }
}
