import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';
import 'package:islami_app/UI/Utils/app_theme.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
List<String> tasbihat =[
  "سبحان الله",
  "الحمد لله",
  "لا إله إلا الله",
  "الله أكبر",

];

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int switchTsbiha = 0;
  int indexInTsbihat =0;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/head_sebha_logo.png"),
          GestureDetector(
            onTap: (){
              counter++;
              checkCounter();
              rotationAngle +=15;
              setState(() {

              });
            },

                child: Transform.rotate(
                  angle: rotationAngle * (3.14159265359 / 180),
                    child: Image.asset("assets/images/body_sebha_logo.png")),

          ),
          SizedBox(height: 30),
          Center(
              child: Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium ,
                textAlign: TextAlign.center,

              )
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(bottom: 15, top: 15, right: 8, left: 8),
            decoration: BoxDecoration(
                color: Color(0xffc8b496),
                borderRadius: BorderRadius.circular(25)),
            child: TextButton(
                child: Text("$counter", style: AppTheme.sebhaTitleTextStyle),
                onPressed: () {
                  counter++;
                  switchTsbiha++;
                  checkCounter();
                  rotationAngle +=15;
                  setState(() {});
                }),
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.primaiary,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              tasbihat[indexInTsbihat],
              style:
                  AppTheme.sebhaTitleTextStyle.copyWith(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }

  void checkCounter() {
    if (switchTsbiha == 34){
      switchTsbiha = 0;
      indexInTsbihat = (indexInTsbihat + 1) % tasbihat.length;
    }

  }
}
