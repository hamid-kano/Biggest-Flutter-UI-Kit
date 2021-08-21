import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCPlayerInfoData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCCricketPlayerInfoScreen extends StatefulWidget {
  static String tag = '/CricketPlayerInfo';

  @override
  _PCCricketPlayerInfoScreenState createState() => _PCCricketPlayerInfoScreenState();
}

class _PCCricketPlayerInfoScreenState extends State<PCCricketPlayerInfoScreen> {
  List<OdiStats> odiStateModel = [];
  PCPlayerInfoData cricketPlayerInfoData = PCPlayerInfoData(odiStats: OdiStats());

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/PlayerInfo.json');
    cricketPlayerInfoData = PCPlayerInfoData.fromJson(jsonDecode(json));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 350),
        child: headerView("Virat Kholi", context),
      ),
      // ignore: unnecessary_null_comparison
      body: cricketPlayerInfoData != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        ClipPath(child: commonCacheImageWidget(Cricket_img_Player, 350, width: context.width(), fit: BoxFit.fill), clipper: HeaderColor()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: <Widget>[
                                    commonCacheImageWidget(Cricket_img_Virat, 90, width: 90, fit: BoxFit.cover).cornerRadiusWithClipRRect(45.0).paddingOnly(left: 16, top: 16),
                                    Container(
                                        height: 30,
                                        width: 30,
                                        decoration: PCboxDecoration(radius: 20.0, bgColor: Cricket_white, showShadow: true),
                                        child: Image.asset(Cricket_ic_batsman, height: 20, width: 20, fit: BoxFit.fill).paddingAll(4))
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Virat Kholi", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 24, fontFamily: fontMedium)).paddingOnly(left: 16, top: 16),
                                Text("India", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 16)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  16.height,
                  Container(
                    decoration: PCboxDecoration(radius: 5.0, bgColor: Cricket_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text("${cricketPlayerInfoData.odiStats!.runs}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                        4.width,
                                        Text("Runs", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text("${cricketPlayerInfoData.odiStats!.highestScore}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                          4.width,
                                          Text("H.Score", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(height: context.width() * 0.2, width: 1, color: Colors.grey.withOpacity(0.5)).paddingOnly(top: 8, bottom: 8),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("100s", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                        4.height,
                                        Text("${cricketPlayerInfoData.odiStats!.hundreds}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("50s", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                          4.height,
                                          Text("${cricketPlayerInfoData.odiStats!.fifties}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Container(height: 0.5, color: Colors.grey.withOpacity(0.5))),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: PCboxDecoration(radius: 50.0, bgColor: Cricket_app_Background),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("${cricketPlayerInfoData.odiStats!.matches}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                  Text("Matches", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontMedium)),
                                ],
                              ),
                            ).paddingOnly(right: 8, left: 8),
                            Expanded(flex: 1, child: Container(height: 0.5, color: Colors.grey.withOpacity(0.5)))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text("${cricketPlayerInfoData.odiStats!.batAverage}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                          4.width,
                                          Text("Avg", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text("${cricketPlayerInfoData.odiStats!.batStrikeRate}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                        4.width,
                                        Text("S.Rate", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(height: context.width() * 0.2, width: 1, color: Colors.grey.withOpacity(0.5)).paddingOnly(top: 8, bottom: 8),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Sixes", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                          4.width,
                                          Text("${cricketPlayerInfoData.odiStats!.sixes}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Fours", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                                        4.width,
                                        Text("${cricketPlayerInfoData.odiStats!.fours}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text("ODI Batting Stats", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(top: 8, bottom: 8, left: 8),
                  Container(
                    decoration: PCboxDecoration(radius: 5.0, bgColor: Cricket_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Matches", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.matches}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Innings", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.innings}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Runs", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.runs}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Highest Score", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.highestScore}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Bat Average", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.batAverage}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Bat Strike Rate", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.batStrikeRate}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Hundreds", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.hundreds}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Fifties", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.fifties}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Sixes", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.sixes}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Fours", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.fours}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ],
                    ),
                  ).paddingAll(8),
                  Text("ODI Bolwing Stats", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(top: 8, bottom: 8, left: 8),
                  Container(
                    decoration: PCboxDecoration(radius: 5.0, bgColor: Cricket_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Matches", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.matches}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Innings", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.bowlInnings}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Wicket Taken", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.wicketsTaken}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Best Performance", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("-/-", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Economy", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.economy}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Five Wickets", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.fiveWicket}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Four Wickets", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.fourWicket}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Maidens", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.maidens}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Bowl Average", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)).paddingOnly(left: 8, top: 4, bottom: 4),
                                Text("${cricketPlayerInfoData.odiStats!.bowlAverage}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(left: 8, right: 8, top: 4, bottom: 4),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ],
                    ),
                  ).paddingAll(8)
                ],
              ),
            )
          : Loader(),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height - 35)
      ..lineTo(size.width, size.height - 100)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
