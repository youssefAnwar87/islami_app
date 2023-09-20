import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_assets.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';

import 'package:islami_app/UI/Utils/app_theme.dart';
import 'package:islami_app/UI/screens/tabs/ahadeth_tab.dart';
import 'package:islami_app/UI/screens/tabs/quran_tab.dart';
import 'package:islami_app/UI/screens/tabs/radio_tab.dart';
import 'package:islami_app/UI/screens/tabs/sebha_tab.dart';

class Homescreen extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentTabIndex = 0;
  List<Widget> tabs =[
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
      child: Scaffold(

        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
     backgroundColor: AppColors.transparent,
          title: Center(child: Text("Islami", style: AppTheme.appBarTitleTextStyle),
        ),

      ),

        body: tabs[currentTabIndex],
        bottomNavigationBar: BuildBottomNavigationBar(),
      )
    );

  }

  Widget BuildBottomNavigationBar()=> Theme(
    data: ThemeData(canvasColor: AppColors.primaiary),
    child: BottomNavigationBar(
      currentIndex:currentTabIndex ,
      onTap: (index){
        currentTabIndex = index ;
        setState(() {});
      },
      selectedItemColor: AppColors.accent,
      iconSize: 32,
      items: [
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label: "Quran"),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: "Ahadeth"),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "Sebha"),
BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "Radio"),
      ],
    ),
  );
}