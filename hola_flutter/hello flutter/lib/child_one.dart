import 'package:flutter/material.dart';

class ChildOne extends StatelessWidget {
  const ChildOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
              "welcome to hello flutter app!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "QwitcherGrypen",
                  fontSize: 34),
            );
  }
}