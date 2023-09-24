import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';

import 'app_theme.dart';


class Mytheme{
  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.accent,
    primaryColor: AppColors.primaiary,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black,size : 30 ),
      titleTextStyle: AppTheme.appBarTitleTextStyle,
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(
size: 32
      ),
        unselectedIconTheme: IconThemeData(
            size: 24
        )

    ),
    textTheme: TextTheme(bodySmall: AppTheme.quranTabTitleTextStyle,
        bodyMedium: AppTheme.sebhaTitleTextStyle.copyWith(fontWeight: FontWeight.w600),
      bodyLarge:  TextStyle(fontSize: 24 , color: AppColors.accent),
    ),
    dividerColor: AppColors.primaiary

  );
  static ThemeData DarkTheme = ThemeData(
    canvasColor: AppColors.accentDark,
    primaryColor: AppColors.primaiaryDark,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black,size : 30 ),
      titleTextStyle: AppTheme.appBarTitleTextStyle.copyWith(color: AppColors.white),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      actionsIconTheme: IconThemeData(
        color: AppColors.white
      )
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accentDark,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(
size: 32
      ),
      unselectedIconTheme: IconThemeData(
        size: 24
      )

    ),
    textTheme: TextTheme(
      bodySmall: AppTheme.quranTabTitleTextStyle.copyWith(color: AppColors.white), //suraOrHadethName
      bodyMedium: AppTheme.sebhaTitleTextStyle.copyWith(fontWeight: FontWeight.w600,color: AppColors.white), //sebha
      bodyLarge:  TextStyle(fontSize: 24 , color: AppColors.accentDark),//list
    ),
      dividerColor: AppColors.accentDark


  );
}