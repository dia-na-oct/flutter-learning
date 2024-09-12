import 'package:flutter/material.dart';
import 'package:funfact/providers/theme.dart';
import 'package:provider/provider.dart';

class themSwitch extends StatefulWidget {
  const themSwitch({super.key});

  @override
  State<themSwitch> createState() => _themSwitchState();
}

class _themSwitchState extends State<themSwitch> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("theme mode"),
          Row(
            children: [
              Switch(
                  value: themeProvider.isdarkmode,
                  onChanged: (value) {
                    themeProvider.updatemod(darkmode: value);
                  }),
              Text(themeProvider.isdarkmode ? "light" : "dark")
            ],
          )
        ],
      ),
    );
  }
}
