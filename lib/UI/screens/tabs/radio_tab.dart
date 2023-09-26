import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_assets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../provider/settingsProvider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        Image.asset(AppAssets.radio),
        SizedBox(height: 30,),
        Text(AppLocalizations.of(context)!.holy_quran_radio, style: provider.isDark()? Theme.of(context).textTheme.bodySmall :Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),textAlign: TextAlign.center,),
        SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {  },
              icon: Icon(provider.currentLocale =='en' ? Icons.skip_previous :Icons.skip_next ,size: 40,color: provider.isDark()  ? Theme.of(context).canvasColor : Theme.of(context).primaryColor),

              ),
            SizedBox(width: 35,),

            IconButton(
              onPressed: () {  },
              icon: Icon(Icons.play_arrow,size: 45,color: provider.isDark()  ? Theme.of(context).canvasColor : Theme.of(context).primaryColor),


              ),
            SizedBox(width: 35,),
            IconButton(
              onPressed: () {  },
              icon: Icon(provider.currentLocale =='en' ?  Icons.skip_next :Icons.skip_previous  ,size: 40,color: provider.isDark()  ? Theme.of(context).canvasColor : Theme.of(context).primaryColor),

              ),
          ],
        ),
        Spacer(flex: 2,),
      ],
    );
  }
}
