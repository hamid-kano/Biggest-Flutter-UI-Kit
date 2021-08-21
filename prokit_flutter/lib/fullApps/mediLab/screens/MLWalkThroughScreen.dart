import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLWalkThroughData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

import 'MLLoginScreen.dart';

class MLWalkThroughScreen extends StatefulWidget {
  static String tag = '/MLWalkThroughScreen';

  @override
  _MLWalkThroughScreenState createState() => _MLWalkThroughScreenState();
}

class _MLWalkThroughScreenState extends State<MLWalkThroughScreen> {
  PageController controller = PageController();

  List<MLWalkThroughData> list = mlWalkThroughDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(mlPrimaryColor, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mlPrimaryColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: list.map((e) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.greenAccent, Colors.blue.shade600]),
                    ),
                    height: 270,
                    width: 230,
                    child: Image.asset(e.imagePath.validate(), fit: BoxFit.contain),
                  ),
                  48.height,
                  Text(e.title.validate(), style: boldTextStyle(size: 28, color: whiteColor)),
                  16.height,
                  Text(e.subtitle.validate(), style: secondaryTextStyle(color: whiteColor), textAlign: TextAlign.center),
                ],
              ).paddingAll(16.0);
            }).toList(),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotIndicator(pageController: controller, pages: list),
                AppButton(
                  onTap: () {
                    finish(context);
                    return MLLoginScreen().launch(context);
                  },
                  child: Text(mlGet_started!, style: boldTextStyle(color: mlPrimaryColor)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Text(mlSkip!, style: boldTextStyle(color: whiteColor)).paddingOnly(top: 8, right: 8).onTap(() {
              finish(context);
              MLLoginScreen().launch(context);
            }),
          ),
        ],
      ),
    );
  }
}
