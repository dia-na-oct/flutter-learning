import 'package:flutter/material.dart';
import 'package:funfact/providers/theme.dart';
import 'package:funfact/screens/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return ThemeProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Provider.of<ThemeProvider>(context, listen: false).loadmode();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      home: Mainscreen(),
      theme: themeProvider.isdarkmode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
    );
  }
}
