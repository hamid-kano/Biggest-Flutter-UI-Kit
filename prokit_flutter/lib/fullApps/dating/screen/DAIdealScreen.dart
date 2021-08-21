import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';

class DAIdealScreen extends StatefulWidget {
  @override
  DAIdealScreenState createState() => DAIdealScreenState();
}

class DAIdealScreenState extends State<DAIdealScreen> {
  List<DatingAppModel> list = getIdealList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('apes', center: true, titleTextStyle: boldTextStyle(size: 25)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.height,
            Text('Ideal Match \nfor you', style: boldTextStyle(size: 30)),
            16.height,
            Text('What are you hoping to find on \nthe Apes dating app?', style: primaryTextStyle()),
            16.height,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: list.map((e) {
                return Container(
                  color: e.color!,
                  height: 170,
                  width: context.width() * 0.5 - 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      Container(
                        color: white.withOpacity(0.3),
                        height: 50,
                        width: 50,
                        child: e.widget,
                      ).cornerRadiusWithClipRRect(25),
                      Text(e.name!, style: boldTextStyle(color: white))
                    ],
                  ),
                ).cornerRadiusWithClipRRect(10);
              }).toList(),
            ),
            16.height,
            AppButton(
              width: context.width(),
              color: primaryColor,
              onTap: () {
                finish(context);
                DADashboardScreen().launch(context);
              },
              text: 'Continue',
              textStyle: boldTextStyle(color: white),
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
