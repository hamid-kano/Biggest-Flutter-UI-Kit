import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';

class DASettingScreen extends StatefulWidget {
  @override
  DASettingScreenState createState() => DASettingScreenState();
}

class DASettingScreenState extends State<DASettingScreen> {
  List<DatingAppModel> list = getSettingData();

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
      appBar: appBarWidget('Setting', center: true, titleTextStyle: boldTextStyle(size: 25)),
      body: Column(
        children: [
          16.height,
          ...list.map(
            (e) {
              return Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: grey)),
                width: context.width(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name!, style: boldTextStyle()),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ).onTap(() {
                e.widget != null ? Navigator.push(context, MaterialPageRoute(builder: (_) => e.widget!)) : SizedBox();
              }, splashColor: white, highlightColor: white);
            },
          ).toList(),
          16.height,
          AppButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Logout', style: boldTextStyle(color: white), textAlign: TextAlign.center),
                Icon(Icons.logout, color: white),
              ],
            ),
            width: context.width(),
            color: primaryColor,
            onTap: () {
              showConfirmDialog(context,'Do you want to logout from the app?');
            },
          ),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
