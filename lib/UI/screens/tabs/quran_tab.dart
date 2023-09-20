import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_assets.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';
import 'package:islami_app/UI/Utils/app_theme.dart';
import 'package:islami_app/UI/Utils/constants.dart';
import 'package:islami_app/UI/screens/details_screen.dart';

import '../../../model/deatils_screen_args.dart';


class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch ,
      children: [
        Expanded(flex : 3 ,child: Image.asset(AppAssets.quranTabLogo)),
        Divider(
          thickness: 3,
          color: AppColors.primaiary,
          
        ),
        Text("Sura name",style: AppTheme.quranTabTitleTextStyle,textAlign: TextAlign.center),
        Divider(
          thickness: 3,
          color: AppColors.primaiary,
        )
       ,   Expanded(flex: 7,
          child:ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (_,index){
              return TextButton(onPressed: (){
                Navigator.pushNamed(_, DeatailsScreen.routeName,
                arguments: DetailsScreenArgs(sureOrHadethName: Constants.suraNames[index], filename: "${index+1}.txt", isQuarnFile: true));
              },
                  child:Text(Constants.suraNames[index],style: AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal),textAlign: TextAlign.center,)
              );
            },

          ),
        )
      ],
    );
  }
}