import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';

class DrawerScreen extends StatefulWidget {
  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  List<DrawerList> drawerList = getDrawerList();

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
    return Theme(
      data: ThemeData(canvasColor: mpAppBackGroundColor),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 260,
              color: mpAppBackGroundColor,
              child: DrawerHeader(
                decoration: BoxDecoration(color: mpAppButtonColor),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.close, color: white),
                        onPressed: () {
                          finish(context);
                        },
                      ),
                    ),
                    commonCacheImageWidget(mpImages_2, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                    16.height,
                    Text('Smith Josh', style: boldTextStyle(color: Colors.white, size: 18)),
                  ],
                ),
              ),
            ),
            Container(
              color: mpAppBackGroundColor,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: drawerList.map((e) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.name!, style: primaryTextStyle(color: white)).paddingAll(8),
                          Divider(color: mpAppTextColor1),
                        ],
                      ).onTap(() {
                        finish(context);
                        e.widget.launch(context);
                      });
                    }).toList(),
                  ).paddingAll(8),
                  16.height,
                  AppButton(
                    child: Text('Sign Out', style: boldTextStyle(color: Colors.white, size: 14)),
                    color: mpAppButtonColor,
                    width: 140,
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  ).cornerRadiusWithClipRRect(16).center(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = Row(
      children: [
        Text("Cancel", style: secondaryTextStyle(color: Colors.white)).onTap(() {
          finish(context);
          finish(context);
        }).paddingOnly(top: 4, bottom: 4),
        32.width,
        Text("OK", style: secondaryTextStyle(color: Colors.white)).paddingOnly(right: 8, top: 4, bottom: 4).onTap(() {
          MPDashboardScreen().launch(context);
        }),
      ],
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: mpBottomBgColor,
      content: Text("Are you sure , you Want to sign out ?", style: boldTextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
