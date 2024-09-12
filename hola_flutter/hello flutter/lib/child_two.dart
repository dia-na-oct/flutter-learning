import 'package:flutter/material.dart';

class ChildTwo extends StatelessWidget {
  const ChildTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/love.png", height: 100, width: 100),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "this app is developped by djihene!!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "QwitcherGrypen",
              fontSize: 34),
        ),
      ],
    );
  }
}
