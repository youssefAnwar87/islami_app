import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/my_theme.dart';
import 'package:islami_app/UI/screens/details_screen.dart';
import 'package:islami_app/UI/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=> SettingProvider()..loadSavedSettings(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider   provider = Provider.of(context);

    return MaterialApp(
      themeMode : provider.currentMode,
      theme: Mytheme.lightTheme ,
      darkTheme: Mytheme.DarkTheme  ,
      locale: Locale(provider.currentLocale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        Homescreen.routeName : (_) => Homescreen(),
        DeatailsScreen.routeName :(_)=> DeatailsScreen(),
      },
      initialRoute: Homescreen.routeName  ,
    );
  }
}

