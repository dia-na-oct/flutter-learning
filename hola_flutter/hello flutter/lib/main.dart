// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_flutter/child_one.dart';
import 'package:hola_flutter/child_three.dart';
import 'package:hola_flutter/child_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("hello_apppp"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ChildOne(),
            ChildTwo(),
            ChildThree(),
          ],
        ),
      ),
    ));
  }
}
