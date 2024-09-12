import 'package:flutter/material.dart';
import 'package:todo_app/mainscreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: mainscreen(),
    theme: ThemeData.light(useMaterial3: true),);
  }
}