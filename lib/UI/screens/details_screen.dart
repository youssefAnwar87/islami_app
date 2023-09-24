import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../model/deatils_screen_args.dart';
import '../../provider/settingsProvider.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_theme.dart';

class DeatailsScreen extends StatefulWidget {
static const String routeName ="details_screen";

  @override
  State<DeatailsScreen> createState() => _DeatailsScreenState();
}

class _DeatailsScreenState extends State<DeatailsScreen> {
late DetailsScreenArgs args;

String fileContent="";

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);

    args = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
   if(fileContent.isEmpty) readFile();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.isDark() ? AppAssets.backgroundDark: AppAssets.background), fit: BoxFit.fill)),
        child: Scaffold(

          backgroundColor: AppColors.transparent,
          appBar: AppBar(

            title: Text(args.sureOrHadethName, style:provider.isDark() ?Theme.of(context).appBarTheme.titleTextStyle!.copyWith(color: AppColors.accentDark) : Theme.of(context).appBarTheme.titleTextStyle),
            iconTheme: provider.isDark() ? Theme.of(context).appBarTheme.iconTheme!.copyWith(color: AppColors.white): Theme.of(context).appBarTheme.iconTheme,

          ),
          body: fileContent.isEmpty ? const  Center(child:  CircularProgressIndicator()) :
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(fileContent,
                textDirection: TextDirection.rtl,
                style:Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),


        )
    );
  }

  void readFile  () async {
    String file = await  rootBundle.loadString(args.isQuarnFile ?"assets/files/quran/${args.filename}" : "assets/files/ahadeth/${args.filename}");
    fileContent = file;
    List<String>fileLines = file.split("\n");
    for(int i = 0 ; i<fileLines.length;i++){
      fileLines[i] += args.isQuarnFile ?  "(${i+1})" : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
