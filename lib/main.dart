import 'package:flutter/material.dart';
import 'package:islami_app/UI/screens/details_screen.dart';
import 'package:islami_app/UI/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      Homescreen.routeName : (_) => Homescreen(),
      DeatailsScreen.routeName :(_)=> DeatailsScreen(),
    },
    initialRoute: Homescreen.routeName  ,
  ));
}

