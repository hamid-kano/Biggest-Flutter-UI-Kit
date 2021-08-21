import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';

class MSettingScreen extends StatefulWidget {
  static String tag = '/MSettingScreen';

  @override
  MSettingScreenState createState() => MSettingScreenState();
}

class MSettingScreenState extends State<MSettingScreen> {
  bool isDisableImgLoad = false;
  bool isDataUsage = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog signOutDialog = AlertDialog(
      backgroundColor: Colors.black87,
      title: Text("Confirmation", style: boldTextStyle(color: white)),
      content: Text("Are you sure you want to logout?", style: secondaryTextStyle(color: appStore.textSecondaryColor)),
      actions: [
        TextButton(
          child: Text("Yes", style: primaryTextStyle(color: mLimeColor)),
          onPressed: () {
            finish(context);
          },
        ),
        TextButton(
          child: Text("No", style: primaryTextStyle(color: mLimeColor)),
          onPressed: () {
            finish(context);
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar(context, 'Settings', color: black, iconColor: white, textColor: white),
      backgroundColor: mGreyColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Facebook', style: primaryTextStyle(color: white)).expand(),
                Text('connect', style: primaryTextStyle(color: mLimeColor)),
              ],
            ),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Twitter', style: primaryTextStyle(color: white)).expand(),
                Text('connect', style: primaryTextStyle(color: mLimeColor)),
              ],
            ),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Dark Mode', style: primaryTextStyle(color: white)).expand(),
                Text('System Default', style: primaryTextStyle(color: mLimeColor)),
              ],
            ),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Toggle Medium beta', style: primaryTextStyle(color: white)).expand(),
                Icon(Icons.chevron_right, size: 30, color: white),
              ],
            ),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Toggle Medium beta', style: primaryTextStyle(color: white)).expand(),
                Icon(Icons.chevron_right, size: 30, color: white),
              ],
            ),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Disable image loading', style: primaryTextStyle(color: white)).expand(),
                Icon(isDisableImgLoad ? Icons.check_box_outline_blank : Icons.check_box, color: isDisableImgLoad ? white : mLimeColor),
              ],
            ).onTap(() {
              isDisableImgLoad = !isDisableImgLoad;
              setState(() {});
            }),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Limit background data usage to wifi only', style: primaryTextStyle(color: white)).expand(),
                Icon(!isDataUsage ? Icons.check_box_outline_blank : Icons.check_box, color: !isDataUsage ? white : mLimeColor),
              ],
            ).onTap(() {
              isDataUsage = !isDataUsage;
              setState(() {});
            }),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Text('Push Notifications', style: primaryTextStyle(color: white)),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Text('Account', style: primaryTextStyle(color: white)),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Text('Email Notifications', style: primaryTextStyle(color: white)),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Text('Join our community', style: primaryTextStyle(color: white)),
            16.height,
            Divider(color: grey, height: 0.5),
            16.height,
            Text('Sign out', style: primaryTextStyle(color: white)).expand().onTap(() {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return signOutDialog;
                },
              );
            }),
            16.height,
            Divider(color: grey, height: 0.5),
            24.height,
          ],
        ),
      ),
    );
  }
}
