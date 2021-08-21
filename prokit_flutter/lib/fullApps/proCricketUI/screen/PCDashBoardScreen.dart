import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCDashboardModel.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCLiveMatchesData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketHistoryScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketMatchDetailScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketMatchInPreviewScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketPointTableScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketRankingScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketScheduleScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketTeamsScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketVenueScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCDataGenerator.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCDashBoardScreen extends StatefulWidget {
  static String tag = '/CricketDashBoard';

  @override
  _PCDashBoardScreenState createState() => _PCDashBoardScreenState();
}

class _PCDashBoardScreenState extends State<PCDashBoardScreen> {
  late List<PCLiveMatchesModel> mList1;
  late List<PCDashboardModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = CricketLiveMatchesList();
    mList2 = CricketDashboardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_Primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            40.height,
            Text(Cricket_lbl_Matches, style: boldTextStyle(color: Cricket_white, size: 30)).paddingAll(16),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      PCCricketMatchDetailScreen(team1: mList1[index].team1, team2: mList1[index].team2).launch(context);
                    } else {
                      PCCricketMatchInPreviewScreen(team1: mList1[index].team1, team2: mList1[index].team2).launch(context);
                    }
                    setState(() {});
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Cricket_Gradient_color2.withOpacity(0.99999999), Cricket_Gradient_color1])),
                        width: 375,
                        child: Column(
                          children: <Widget>[
                            10.height,
                            Text(mList1[index].title, style: secondaryTextStyle(size: 14, color: Cricket_white, fontFamily: fontMedium)).paddingOnly(top: 24.0, left: 16.0, bottom: 8.0),
                            Text(mList1[index].place, style: boldTextStyle(color: Cricket_white, size: 18, fontFamily: fontSemiBold)).paddingOnly(left: 16.0, bottom: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(color: Cricket_white, shape: BoxShape.circle),
                                      child: commonCacheImageWidget(Cricket_Logo, 10, width: 10, fit: BoxFit.fill).paddingAll(16.0),
                                    ).paddingOnly(left: 16.0),
                                    Text(mList1[index].team1, style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium)).paddingOnly(left: 8.0, right: 16.0)
                                  ],
                                ).expand(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(color: Cricket_white, shape: BoxShape.circle),
                                      child: commonCacheImageWidget(Cricket_Logo, 10, width: 10, fit: BoxFit.fill).paddingAll(16.0),
                                    ).paddingOnly(left: 16.0),
                                    Text(mList1[index].team2, style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium)).paddingOnly(left: 8.0, right: 16.0)
                                  ],
                                ).expand(flex: 1)
                              ],
                            ),
                            Text(mList1[index].won, style: boldTextStyle(size: 18, color: Cricket_white)).paddingOnly(top: 16.0, left: 16.0, bottom: 16.0),
                          ],
                        ),
                      ).cornerRadiusWithClipRRect(10.0).paddingOnly(left: 16.0, top: 16.0),
                      Container(
                        width: context.width() * .9,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: PCboxDecoration(radius: 6.0, bgColor: Colors.green),
                              child: Text(mList1[index].type, style: primaryTextStyle(color: Cricket_white, size: 16)).paddingOnly(left: 8.0, right: 8.0),
                            ).paddingOnly(top: 8.0, left: 24.0),
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              height: mList1[index].live == true ? 25 : 0,
                              decoration: PCboxDecoration(radius: 6.0, bgColor: Cricket_white),
                              child: Row(
                                children: <Widget>[
                                  Container(width: 8, height: 8, decoration: PCboxDecoration(radius: 5.0, bgColor: Colors.green)).center().paddingOnly(left: 8.0),
                                  Text("Live Match", style: primaryTextStyle(size: 14, color: Cricket_Primary)).paddingOnly(left: 8.0, right: 8.0),
                                ],
                              ),
                            ).paddingOnly(top: 8.0, left: 24.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            16.height,
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  print(index);
                  if (index == 0)
                    PCCricketScheduleScreen().launch(context);
                  else if (index == 1)
                    PCCricketTeamsScreen().launch(context);
                  else if (index == 2)
                    PCCricketVenueScreen().launch(context);
                  else if (index == 3)
                    PCCricketPointTableScreen().launch(context);
                  else if (index == 4)
                    PCCricketRankingScreen().launch(context);
                  else if (index == 5) PCCricketHistoryScreen().launch(context);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: Cricket_color1.withOpacity(0.25), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(mList2[index].icon, height: 30, width: 30, color: Cricket_white).paddingOnly(left: 8.0, top: 8.0, bottom: 8.0),
                          16.width,
                          Text(mList2[index].title, style: primaryTextStyle(size: 18, color: Cricket_white, fontFamily: fontMedium)).paddingOnly(left: 8.0),
                        ],
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: Cricket_SkyBlue_Color, borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(Cricket_ic_ArrowRight, color: Cricket_white, height: 25, width: 25).paddingAll(8.0),
                      ).paddingOnly(right: 8.0)
                    ],
                  ),
                ).cornerRadiusWithClipRRect(10.0).paddingAll(8.0),
              ),
            ).paddingOnly(left: 8.0, right: 8.0, bottom: 8.0),
          ],
        ),
      ),
    );
  }
}
