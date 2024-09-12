import 'dart:ffi';

import 'package:flutter/material.dart';

class balanceAug extends StatelessWidget {
  double balance;
   balanceAug({super.key,required this.balance});


  @override
  Widget build(BuildContext context) {
    return Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("bank balance "),
                      Text('$balance'),
                    ],
                  ),
                );
  }
}