import 'package:flutter/cupertino.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';

abstract class AppTheme{
  static  TextStyle appBarTitleTextStyle = TextStyle(
      fontSize:  30 , fontWeight: FontWeight.bold, color: AppColors.accent);

  static  TextStyle quranTabTitleTextStyle = TextStyle(
      fontSize:  25 , fontWeight: FontWeight.w600, color: AppColors.accent);

  static  TextStyle sebhaTitleTextStyle = TextStyle(
      fontSize:  25 , fontWeight: FontWeight.normal, color: AppColors.accent);
}