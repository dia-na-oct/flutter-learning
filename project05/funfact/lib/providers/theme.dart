import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isdarkmode = false;
  void updatemod({required  bool darkmode})async{
    isdarkmode = darkmode;
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool('darkmode', darkmode);
    notifyListeners();
  }
   void loadmode()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.getBool('darkmode')??true;
    notifyListeners();
  }
}
