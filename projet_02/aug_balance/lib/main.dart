import 'package:aug_balance/balance_aug.dart';
import 'package:aug_balance/earn_money.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balanace = 500;
  void function() async {
    setState(() {
      balanace = balanace + 500;
    });
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balanace', balanace);
    print(balanace);
  }

  void loadbalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balanace = prefs.getDouble('balanace') ?? 0;
    });
  }

  @override
  void initState() {
    loadbalance();
    super.initState();
  }

//the build methid in statefullwidgets to update each time we do a change in what is in the state
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: Scaffold(
          appBar:
              AppBar(centerTitle: true, title: const Text("bilionnaire app!")),
          body: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blueGrey[700],
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                balanceAug(balance: balanace,),
                EarnMoney(
                  earnMoneyFunction: function,
                ),
              ],
            ),
          ),
        ));
  }
}
