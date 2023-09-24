import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLocale ="en";
  ThemeMode currentMode = ThemeMode.light;
  changeCurrentLocale(String newLocale){
currentLocale = newLocale;
notifyListeners();
}
changeCurrentMode(ThemeMode newMode){
    currentMode = newMode;
notifyListeners();
}
bool isDark()=> currentMode == ThemeMode.dark;
}