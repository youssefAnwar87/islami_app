import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/UI/Utils/app_colors.dart';
import 'package:islami_app/UI/Utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../provider/settingsProvider.dart';
import '../../Utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

List<String> tasbihat = [
  "سبحان الله",
  "الحمد لله",
  "لا إله إلا الله",
  "الله أكبر",
];

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int switchTsbiha = 0;
  int indexInTsbihat = 0;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight *0.45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin : EdgeInsets.only(left: screenWidth*0.09) ,
                    child: Image.asset(provider.isDark()
                        ? "assets/images/head_sebha_dark.png"
                        : "assets/images/head_sebha_logo.png"),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        counter++;
                        switchTsbiha++;
                        checkCounter();
                        rotationAngle += 15;
                        setState(() {});
                      },
                      child: Transform.rotate(
                        angle: rotationAngle * (3.14159265359 / 180),
                        child: Image.asset(provider.isDark()
                            ? "assets/images/body_sebha_dark.png"
                            : "assets/images/body_sebha_logo.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.01,
                    child: Text(
                      AppLocalizations.of(context)!.number_of_praises,
                      style: provider.isDark()
                          ? Theme.of(context).textTheme.bodySmall
                          : Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              decoration: BoxDecoration(
                color: provider.isDark()
                    ? Color(0xff151c31)
                    : Color(0xffc8b496),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                  ),
                ),
                onPressed: () {
                  counter++;
                  switchTsbiha++;
                  checkCounter();
                  rotationAngle += 15;
                  setState(() {});
                },
                child: Text(
                  "$counter",
                  style: AppTheme.sebhaTitleTextStyle.copyWith(
                    color: provider.isDark() ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                color: provider.isDark()
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                tasbihat[indexInTsbihat],
                style: AppTheme.sebhaTitleTextStyle.copyWith(
                  color: provider.isDark() ? Colors.black : AppColors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(), // Spacer at the bottom
            ),
          ],
        ),
      ),
    );
  }

  void checkCounter() {
    if (switchTsbiha == 33) {
      switchTsbiha = 0;
      indexInTsbihat = (indexInTsbihat + 1) % tasbihat.length;
    }
  }
}
