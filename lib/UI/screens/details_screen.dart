import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/deatils_screen_args.dart';
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
    args = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
   if(fileContent.isEmpty) readFile();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
        child: Scaffold(

          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            centerTitle: true,
            title: Text(args.sureOrHadethName, style: AppTheme.appBarTitleTextStyle),

          ),
          body: fileContent.isEmpty ? const  Center(child:  CircularProgressIndicator()) :
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(fileContent,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 24 , color: AppColors.accent),
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
