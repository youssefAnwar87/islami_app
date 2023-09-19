import 'package:flutter/material.dart';
import 'package:islami_app/UI/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      Homescreen.routeName : (_) => Homescreen(),
    },
    initialRoute: Homescreen.routeName  ,
  ));
}

