import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSConnectWithComputerScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CSWalkthroughScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(""),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CSCloudboxLogo, height: 200),
              Wrap(
                children: [
                  Text("Access your computer's files on this device", textAlign: TextAlign.center, style: boldTextStyle(size: 25)).paddingTop(20),
                  Text("Changes you make to files on your computer will also appear on this device.", textAlign: TextAlign.center, style: primaryTextStyle(size: 17)).paddingTop(20)
                ],
              ),
              Text("Not near your computer?", style: primaryTextStyle(size: 18, color: Colors.grey)).paddingTop(20),
              Text("Email me a link", style: primaryTextStyle(size: 18, color: CSDarkBlueColor, decoration: TextDecoration.underline)),
              Container(
                height: 50,
                decoration: BoxDecoration(color: CSDarkBlueColor),
                child: Text('Setup', style: boldTextStyle(color: Colors.white, size: 17)).center(),
              ).paddingTop(30).onTap(() {
                CSConnectWithComputerScreen().launch(context);
              }),
            ],
          ).paddingAll(20),
        ),
      ),
    );
  }
}
