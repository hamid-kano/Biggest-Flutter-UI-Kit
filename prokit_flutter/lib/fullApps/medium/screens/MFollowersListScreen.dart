import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';

class MFollowersListScreen extends StatefulWidget {
  static String tag = '/MFollowersListScreen';

  @override
  MFollowersListScreenState createState() => MFollowersListScreenState();
}

class MFollowersListScreenState extends State<MFollowersListScreen> {
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
    return Scaffold(
      backgroundColor: mGreyColor,
      appBar: appBar(context, 'Followers', color: black, iconColor: white, textColor: white),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: 1,
        shrinkWrap: true,
        separatorBuilder: (_, index) => Divider(),
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: transparentColor, borderRadius: BorderRadius.circular(50), border: Border.all(color: greenColor)),
                    child: Image.asset(app_ic_medium, height: 40, width: 40, color: white).cornerRadiusWithClipRRect(10)),
                20.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medium Staff", style: boldTextStyle(color: white, size: 16)),
                    Text("News and updates from the staff at Medium", style: primaryTextStyle(color: white, size: 14)).expand(),
                  ],
                ).expand(),
                10.width,
                Container(
                  decoration: boxDecoration(color: mLimeColor, bgColor: Colors.transparent, radius: 5),
                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                  child: Text("Following", style: primaryTextStyle(color: white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
