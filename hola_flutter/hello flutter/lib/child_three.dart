import 'package:flutter/material.dart';

class ChildThree extends StatelessWidget {
  const ChildThree({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Image.asset("assets/images/love.png",
                      height: 100, width: 100),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "djihene",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QwitcherGrypen",
                            fontSize: 24),
                      ),
                      Text(
                        "flutter developper",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QwitcherGrypen",
                            fontSize: 24),
                      ),
                      Text(
                        "www.djidji.com",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "QwitcherGrypen",
                            fontSize: 24),
                      ),
                    ],
                  )
                ],
              ),
            );
  }
}