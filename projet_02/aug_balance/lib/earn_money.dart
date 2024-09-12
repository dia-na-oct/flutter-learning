import 'package:flutter/material.dart';

class EarnMoney extends StatelessWidget {
  void Function() earnMoneyFunction;
  EarnMoney({super.key, required this.earnMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(double.infinity, 0),
          ),
          onPressed: earnMoneyFunction,
          child: const Text("earn money ")),
    );
  }
}
