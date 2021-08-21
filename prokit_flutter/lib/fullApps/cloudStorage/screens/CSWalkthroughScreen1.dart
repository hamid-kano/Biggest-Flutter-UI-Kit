import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSWalkthroughScreen2.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';

class CSWalkthroughScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(""),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CSCloudboxLogo),
              Wrap(
                children: [
                  Text("Cloudbox works best with files. Do you want to upload some photos?", textAlign: TextAlign.center, style: boldTextStyle(size: 23)).paddingTop(20),
                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(color: CSDarkBlueColor),
                child: Text('Select photos to upload', style: boldTextStyle(color: Colors.white, size: 17)).center(),
              ).paddingTop(20).onTap(() {}),
              TextButton(
                onPressed: () {
                  CSWalkthroughScreen2().launch(context);
                },
                child: Text("Skip", style: boldTextStyle(size: 17, color: CSDarkBlueColor)),
              ).paddingTop(10)
            ],
          ).paddingAll(25),
        ),
      ),
    );
  }
}
