import 'package:flutter/material.dart';
import 'package:islami_app/UI/screens/details_screen.dart';
import 'package:islami_app/UI/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MaterialApp(
    locale: Locale('ar'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    debugShowCheckedModeBanner: false,
    routes: {
      Homescreen.routeName : (_) => Homescreen(),
      DeatailsScreen.routeName :(_)=> DeatailsScreen(),
    },
    initialRoute: Homescreen.routeName  ,
  ));
}

