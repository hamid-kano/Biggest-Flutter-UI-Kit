import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCScheduleData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketMatchDetailScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class PCCricketMatchListScreen extends StatefulWidget {
  static String tag = '/CricketMatchList';
  String? groundName = "";

  PCCricketMatchListScreen({this.groundName});

  @override
  _PCCricketMatchListScreenState createState() => _PCCricketMatchListScreenState();
}

class _PCCricketMatchListScreenState extends State<PCCricketMatchListScreen> {
  PCScheduleData model = PCScheduleData(schedule: []);
  List listSchedule = [];
  List<Schedule> list = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/schedule.json');

    model = PCScheduleData.fromJson(jsonDecode(json));

    for (int i = 0; i < model.schedule!.length; i++) {
      if (model.schedule![i].vnu == widget.groundName) {
        listSchedule.add(model.schedule![i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 350),
        child: headerView(widget.groundName, context),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listSchedule.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Schedule schedule = listSchedule[index];
              return Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        width: context.width(),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getDarkColor(schedule.team1Key))),
                                        Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getLightColor(schedule.team1Key))),
                                      ],
                                    ),
                                    schedule.team1Key.validate().isNotEmpty ? commonCacheImageWidget(getBgFlag(schedule.team1Key), context.width() * 0.1) : SizedBox.shrink(),
                                    // text
                                  ],
                                ),
                                Text(schedule.team1Key!.toUpperCase(), style: primaryTextStyle(color: Cricket_white, size: 24, fontFamily: fontMedium)),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getDarkColor(schedule.team2Key))),
                                        Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getLightColor(schedule.team2Key))),
                                      ],
                                    ),
                                    schedule.team2Key.validate().isNotEmpty ? commonCacheImageWidget(getBgFlag(schedule.team2Key), context.width() * 0.1) : SizedBox.shrink(),
                                    // text
                                  ],
                                ),
                                Text(schedule.team2Key!.toUpperCase(), style: primaryTextStyle(color: Cricket_white, size: 24, fontFamily: fontMedium)),
                              ],
                            ),
                          ],
                        ),
                      ).cornerRadiusWithClipRRect(10.0).paddingOnly(left: 8, right: 8, top: 16),
                      commonCacheImageWidget(Cricket_ic_ball_white, 65, width: 65).center()
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    width: context.width(),
                    decoration: BoxDecoration(
                      color: Cricket_white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(schedule.vnu!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 18, fontFamily: fontMedium)),
                        10.height,
                        Text(schedule.result!, style: primaryTextStyle(color: Cricket_Primary, size: 18, fontFamily: fontMedium))
                      ],
                    ),
                  )
                ],
              ).onTap(() {
                PCCricketMatchDetailScreen().launch(context);
              }).paddingOnly(bottom: 16);
            }),
      ),
    );
  }
}
