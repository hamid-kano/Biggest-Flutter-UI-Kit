import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPProfileScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/screen/MPTermsConditionScreen.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:prokit_flutter/fullApps/musicPodcast/utils/MPImages.dart';

class MPSettingScreen extends StatefulWidget {
  static String tag = '/MPSettingScreen';

  @override
  MPSettingScreenState createState() => MPSettingScreenState();
}

class MPSettingScreenState extends State<MPSettingScreen> {
  bool value = true;

  List<MusicModel> profileList = getProfileList();

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
      backgroundColor: mpAppBackGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: mpDrawerBackGroundColor,
        title: Text("Setting", style: boldTextStyle(color: white.withOpacity(0.9))),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: context.width(),
              color: mpDrawerBackGroundColor,
              child: Column(
                children: [
                  commonCacheImageWidget(mpImages_2, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                  16.height,
                  Text('Smith Josh', style: boldTextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white.withOpacity(0.3), indent: 20),
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: profileList.length,
              itemBuilder: (BuildContext context, int index) {
                MusicModel data = profileList[index];

                return Row(
                  children: [
                    Text(data.title!, style: primaryTextStyle(color: Colors.white)).paddingOnly(left: 16, top: 8, bottom: 8).expand(),
                    data.isShow
                        ? Icon(data.icon, color: Colors.grey)
                        : Switch(
                            activeColor: white,
                            activeTrackColor: mpAppButtonColor,
                            inactiveTrackColor: gray,
                            value: value,
                            onChanged: (val) {
                              setState(() {
                                value = val;
                              });
                            },
                          )
                  ],
                ).onTap(() {
                  if (index == 7) {
                    MPTermsConditionScreen().launch(context);
                  } else if (index == 1) {
                    MPEditProfileScreen().launch(context);
                  } else if (index == 0) {
                    MPProfileScreen(isTab: true).launch(context);
                  } else if (index == 4) {
                    setState(() {
                      value = !value;
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
