import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCRanking.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCCricketRankingScreen extends StatefulWidget {
  static String tag = '/CricketRanking';

  @override
  _PCCricketRankingScreenState createState() => _PCCricketRankingScreenState();
}

class _PCCricketRankingScreenState extends State<PCCricketRankingScreen> {
  List<Rank> odiBatsmanList = [];
  List<Rank> odiBowlingList = [];
  List<Rank> odiAllRounderList = [];
  List<ODI> odiTeamList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/ranking.json');
    PCRanking cricketRankingData = PCRanking.fromJson(jsonDecode(json));

    odiBatsmanList.addAll(cricketRankingData.player!.oDI!.batting!);
    odiBowlingList.addAll(cricketRankingData.player!.oDI!.bowling!);
    odiAllRounderList.addAll(cricketRankingData.player!.oDI!.allrounder!);
    odiTeamList.addAll(cricketRankingData.team!.oDI!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Cricket_app_Background,
          appBar: PreferredSize(
            preferredSize: Size(context.width(), 135),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    commonCacheImageWidget(Cricket_ic_gradient, 60, fit: BoxFit.fill, width: context.width()),
                    Row(
                      children: <Widget>[
                        Icon(Icons.arrow_back, size: 25, color: Cricket_white).paddingAll(4).onTap(() {
                          finish(context);
                        }),
                        Text(Cricket_lbl_ODI_Ranking, style: boldTextStyle(color: Cricket_white, size: 18)).paddingOnly(left: 8, right: 8),
                      ],
                    ).paddingOnly(left: 8, right: 16, top: 16, bottom: 8)
                  ],
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      commonCacheImageWidget(Cricket_ic_gradient, context.width() * 0.15, fit: BoxFit.fill, width: context.width()),
                      Container(
                        child: TabBar(
                          labelPadding: EdgeInsets.only(left: 0, right: 0),
                          indicatorWeight: 4.0,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Cricket_white,
                          labelColor: Cricket_white,
                          isScrollable: true,
                          unselectedLabelColor: Cricket_textColorSecondary,
                          tabs: [
                            Container(padding: EdgeInsets.all(16.0), child: Text("Batting", style: boldTextStyle(size: 16, color: Cricket_white))),
                            Container(padding: EdgeInsets.all(16.0), child: Text("Bowling", style: boldTextStyle(size: 16, color: Cricket_white))),
                            Container(padding: EdgeInsets.all(16.0), child: Text("All-Rounder", style: boldTextStyle(size: 16, color: Cricket_white))),
                            Container(padding: EdgeInsets.all(16.0), child: Text("Teams", style: boldTextStyle(size: 16, color: Cricket_white)))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: context.width(),
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Colors.blueGrey.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Flexible(flex: 1, child: Text("Pos", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                  10.width,
                                  Flexible(flex: 1, child: Text("Player", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                ],
                              ),
                            ),
                            Flexible(flex: 2, child: Text("Ratting", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)))
                          ],
                        )),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: odiBatsmanList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(),
                          color: (index.isEven ? Cricket_white : Colors.grey.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(odiBatsmanList[index].rank!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 16, right: 16),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        commonCacheImageWidget(Cricket_ic_default_user, 40, width: 40).cornerRadiusWithClipRRect(25.0).paddingOnly(top: 16, bottom: 16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(odiBatsmanList[index].name!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(top: 16, left: 8),
                                            Text(odiBatsmanList[index].country!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(left: 8),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(odiBatsmanList[index].rating!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(top: 8, right: 16, bottom: 8),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: context.width(),
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Colors.blueGrey.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Flexible(flex: 1, child: Text("Pos", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                  10.width,
                                  Flexible(flex: 1, child: Text("Player", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                ],
                              ),
                            ),
                            Flexible(flex: 2, child: Text("Ratting", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)))
                          ],
                        )),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: odiBowlingList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(),
                          color: (index.isEven ? Cricket_white : Colors.grey.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(odiBowlingList[index].rank!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 16, right: 16),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        commonCacheImageWidget(Cricket_ic_default_user, 40, width: 40).cornerRadiusWithClipRRect(25.0).paddingOnly(top: 16, bottom: 16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(odiBowlingList[index].name!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(top: 16, left: 8),
                                            Text(odiBowlingList[index].country!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(left: 8),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(odiBowlingList[index].rating!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(top: 8, right: 16, bottom: 8),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: context.width(),
                        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Colors.blueGrey.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Flexible(flex: 1, child: Text("Pos", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                  10.width,
                                  Flexible(flex: 1, child: Text("Player", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))),
                                ],
                              ),
                            ),
                            Flexible(flex: 2, child: Text("Ratting", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)))
                          ],
                        )),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: odiAllRounderList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(),
                          color: (index.isEven ? Cricket_white : Colors.grey.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(odiAllRounderList[index].rank!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 16, right: 16),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        commonCacheImageWidget(Cricket_ic_default_user, 40, width: 40).cornerRadiusWithClipRRect(25.0).paddingOnly(top: 16, bottom: 16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(odiAllRounderList[index].name!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular))
                                                .paddingOnly(top: 16, left: 8),
                                            Text(odiAllRounderList[index].country!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(left: 8),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(odiAllRounderList[index].rating!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(top: 8, right: 16, bottom: 8),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: context.width(),
                        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Colors.blueGrey.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: <Widget>[
                                  Text("Pos", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingAll(8),
                                  Text("Player", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingAll(8),
                                ],
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: Text("Ratting", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(top: 8, left: 8, right: 16, bottom: 8)),
                            Flexible(flex: 1, child: Text("Point", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(top: 8, right: 8, bottom: 8))
                          ],
                        ).paddingOnly(right: 4)),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: odiTeamList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(),
                          color: (index.isEven ? Cricket_white : Colors.grey.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(odiTeamList[index].rank!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)),
                                      padding: EdgeInsets.only(left: 16, right: 16),
                                      width: 50,
                                      alignment: Alignment.centerLeft,
                                    ),
                                    Text(odiTeamList[index].name!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 14, fontFamily: fontRegular)).paddingOnly(top: 8, left: 8, bottom: 8),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(odiTeamList[index].rating!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium), textAlign: TextAlign.end)
                                    .paddingOnly(top: 8, bottom: 8),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(odiTeamList[index].points!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                    .paddingOnly(top: 8, right: 16, bottom: 8),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
