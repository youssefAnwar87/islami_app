import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';
import 'package:islami_app/UI/Utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../../../provider/settingsProvider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
bool darkModeSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * .1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            textAlign: TextAlign.start,),
          InkWell(
              onTap: () {
                onLanguageRowClick(context);
              },
              child: getRowOption(provider.currentLocale == "en" ? "English" : "العربيه", context)),
          SizedBox(height: 20,),
          buildSettingsRow(AppLocalizations.of(context)!.mode, darkModeSwitchValue, (value){
            darkModeSwitchValue = value;
            if(darkModeSwitchValue){
              provider.changeCurrentMode(ThemeMode.dark);

            }else{
              provider.changeCurrentMode(ThemeMode.light);


            }
          },context),


        ],
      ),
    );
  }

  Widget getRowOption(String selectedOption, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme
              .of(context)
              .primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedOption, style: Theme
              .of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black87),),
          Icon(Icons.arrow_drop_down),

        ],
      ),
    );
  }

  void onLanguageRowClick(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
      SettingProvider   provider = Provider.of(context);

      return Container(
        color: AppColors.white,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.select_your_language, style: Theme
                .of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black,)),
            Divider(
              thickness: 3,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox( height: 10),
            InkWell(
              onTap: (){
                provider.changeCurrentLocale("en");
                Navigator.pop(context);
              },
              child:   getLanguageRow(provider.currentLocale == 'en', "English", context),

            ),
            SizedBox( height: 10),
            InkWell(
              onTap: (){
                provider.changeCurrentLocale("ar");
                Navigator.pop(context);


              },
              child:   getLanguageRow(provider.currentLocale == 'ar', "العربيه", context),
            )

          ],
        ),
      );
    });
  }

  getLanguageRow(bool isSelected, String language, BuildContext context) {
    SettingProvider provider = Provider.of(context);

    if (isSelected) {
      return Text(
        language,
        style: provider.isDark() ? Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).canvasColor)
        : Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).primaryColor),

      );
    } else {
      return Text(
        language,
        style: Theme
            .of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black),
      );
    }
  }

  Widget buildSettingsRow(String title , bool switchValue,Function (bool)onChanged,BuildContext context){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodySmall,),
        Switch(value: darkModeSwitchValue, onChanged: onChanged, activeColor: Theme.of(context).canvasColor,)
      ],
    );
  }
}


