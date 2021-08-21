import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/model/DatingAppModel.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAProfileViewAllScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DASettingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/screen/DAZoomingScreen.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAColors.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DADataGenerator.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';

class DAProfileFragment extends StatefulWidget {
  @override
  DAProfileFragmentState createState() => DAProfileFragmentState();
}

class DAProfileFragmentState extends State<DAProfileFragment> {
  List<DatingAppModel> list = getAllListData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.shuffle();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Profile',
        center: true,
        titleTextStyle: boldTextStyle(size: 25),
        showBack: false,
        actions: [
          Icon(Icons.settings).paddingOnly(right: 16).onTap(() {
            DASettingScreen().launch(context);
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                16.height,
                commonCachedNetworkImage(
                  'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.6.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ).cornerRadiusWithClipRRect(75),
                16.height,
                Text('Eren Turkmen', style: boldTextStyle()),
                8.height,
                Text('UI/UX Designer', style: secondaryTextStyle()),
                16.height,
                AppButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.wifi_tethering_rounded, color: white),
                      Text('Upgrade your profile', style: boldTextStyle(color: white), textAlign: TextAlign.center),
                      SizedBox(),
                    ],
                  ),
                  width: context.width(),
                  color: primaryColor,
                  onTap: () {
                    DASettingScreen().launch(context);
                  },
                ),
              ],
            ),
            16.height,
            Text('Biography', style: boldTextStyle(size: 25)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s.',
              style: secondaryTextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gallery', style: boldTextStyle()),
                Text('View All', style: primaryTextStyle(color: primaryColor)).onTap(() {
                  DAProfileViewAllScreen().launch(context);
                }),
              ],
            ),
            16.height,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: list.take(12).map((e) {
                return commonCachedNetworkImage(
                  e.image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: (context.width() / 3) - 22,
                ).cornerRadiusWithClipRRect(10).onTap(() {
                  DAZoomingScreen(img: e.image).launch(context);
                }, highlightColor: white, splashColor: white);
              }).toList(),
            ),
          ],
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
