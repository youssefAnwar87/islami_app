import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_assets.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';

import 'package:islami_app/UI/Utils/app_theme.dart';
import 'package:islami_app/UI/Utils/my_theme.dart';
import 'package:islami_app/UI/screens/tabs/ahadeth_tab.dart';
import 'package:islami_app/UI/screens/tabs/quran_tab.dart';
import 'package:islami_app/UI/screens/tabs/radio_tab.dart';
import 'package:islami_app/UI/screens/tabs/sebha_tab.dart';
import 'package:islami_app/UI/screens/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settingsProvider.dart';
import 'package:provider/provider.dart';
class Homescreen extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentTabIndex = 3;
  List<Widget> tabs =[
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.isDark() ?AppAssets.backgroundDark : AppAssets.background ), fit: BoxFit.fill)),
      child: Scaffold(

        appBar: AppBar(

          title: Text(AppLocalizations.of(context)!.app_title),

      ),

        body: tabs[currentTabIndex],
        bottomNavigationBar: BuildBottomNavigationBar(),
      )
    );

  }

  Widget BuildBottomNavigationBar()=> Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      currentIndex:currentTabIndex ,
      onTap: (index){
        currentTabIndex = index ;
        setState(() {});
      },
      iconSize: 32,

      items: [
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label:AppLocalizations.of(context)!.quran ),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: AppLocalizations.of(context)!.hadeth),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: AppLocalizations.of(context)!.sebha),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: AppLocalizations.of(context)!.radio),
BottomNavigationBarItem(icon:Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
      ],
    ),
  );
}
