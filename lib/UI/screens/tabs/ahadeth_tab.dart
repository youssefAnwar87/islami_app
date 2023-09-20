import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/deatils_screen_args.dart';
import '../../Utils/app_assets.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_theme.dart';
import '../../Utils/constants.dart';
import '../details_screen.dart';

class AhadethTab extends StatelessWidget {
List<String>ahadethNames = List.generate(50, (index){
  return "${index+1}الحديث رقم ";
});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch ,
      children: [
        Expanded(flex : 3 ,child: Image.asset(AppAssets.ahadethTabLogo)),
        Divider(
          thickness: 3,
          color: AppColors.primaiary,

        ),
        Text("Hadeth name",style: AppTheme.quranTabTitleTextStyle,textAlign: TextAlign.center),
        Divider(
          thickness: 3,
          color: AppColors.primaiary,
        )
        ,   Expanded(flex: 7,
          child:ListView.builder(
            itemCount: ahadethNames.length,
            itemBuilder: (_,index){
              return TextButton(onPressed: (){
                Navigator.pushNamed(_, DeatailsScreen.routeName,
                    arguments: DetailsScreenArgs(sureOrHadethName: ahadethNames[index], filename: "h${index+1}.txt", isQuarnFile: false));
              },
                  child:Text(ahadethNames[index],style: AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal),textAlign: TextAlign.center,)
              );
            },

          ),
        )
      ],
    );
  }
}
