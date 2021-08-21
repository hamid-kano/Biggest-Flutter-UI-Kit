import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCCommentaryInProgressData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCSummaryData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketPlayerListScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketScoreCardScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCDataGenerator.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class PCCricketMatchDetailScreen extends StatefulWidget {
  static String tag = '/CricketMatchDetail';
  String? team1 = "";
  String? team2 = "";

  PCCricketMatchDetailScreen({this.team1, this.team2});

  @override
  _PCCricketMatchDetailScreenState createState() => _PCCricketMatchDetailScreenState();
}

class _PCCricketMatchDetailScreenState extends State<PCCricketMatchDetailScreen> {
  late PCCommentaryInProgressData cricketCommentaryInProgressData;
  PCSummaryData? cricketSummaryData;
  List momModel = [];
  List<Player> playerModel = [];
  List<Batsman> batsmenModel = [];
  List<Bowler> bowlerModel = [];
  List<Inning> inningsModel = [];
  List<CommLine> commLineModel = [];

  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    String json1 = await rootBundle.loadString('assets/cricket_data/CommentaryInProgress.json');
    cricketCommentaryInProgressData = PCCommentaryInProgressData.fromJson(jsonDecode(json1));
    String json2 = await rootBundle.loadString('assets/cricket_data/Summary.json');
    cricketSummaryData = PCSummaryData.fromJson(jsonDecode(json2));
    playerModel.addAll(cricketSummaryData!.players!);
    momModel.addAll(cricketSummaryData!.header!.momNames!);
    batsmenModel.addAll(cricketCommentaryInProgressData.batsman!);
    bowlerModel.addAll(cricketCommentaryInProgressData.bowler!);
    inningsModel.addAll(cricketCommentaryInProgressData.bat_team!.innings!);
    commLineModel.addAll(cricketCommentaryInProgressData.comm_lines!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getPlayerName(String? id) {
      String? playerName;
      for (int i = 0; i < playerModel.length; i++) {
        if (playerModel[i].id == id) {
          playerName = playerModel[i].f_name;
        }
      }
      return playerName;
    }

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Cricket_white,
          appBar: PreferredSize(
            preferredSize: Size(context.width(), 370),
            child: cricketSummaryData != null
                ? Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          commonCacheImageWidget(Cricket_ic_gradient, 70, width: context.width(), fit: BoxFit.cover),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.arrow_back, size: 25, color: Cricket_white).paddingOnly(left: 8.0).onTap(() {
                                    finish(context);
                                  }),
                                  Text("${getTeamName(widget.team1)} vs ${getTeamName(widget.team2)}", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                      .paddingOnly(left: 16, right: 8.0),
                                ],
                              ),
                              Icon(Icons.info_outline, color: Cricket_white).paddingOnly(right: 8.0).onTap(() {
                                showBottomSheetDialog(context);
                              })
                            ],
                          ).paddingTop(16),
                        ],
                      ),
                      Container(
                        height: 225,
                        decoration: PCboxDecoration(bgColor: Cricket_white),
                        child: Stack(
                          children: <Widget>[
                            commonCacheImageWidget(Cricket_ic_lord_london, 225, width: context.width(), fit: BoxFit.cover),
                            Container(
                              width: context.width(),
                              decoration: PCboxDecoration(bgColor: Cricket_Primary.withOpacity(0.75)),
                              child: Column(
                                children: <Widget>[
                                  Text(cricketSummaryData!.header!.match_desc.validate(), style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)).paddingOnly(top: 8.0),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              commonCacheImageWidget(Cricket_ic_default_placeholder, 70, width: 70, fit: BoxFit.fill).paddingOnly(top: 16, left: 16),
                                              Column(
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(inningsModel[0].score!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                                      Text("-", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)).paddingOnly(left: 4.0, right: 4),
                                                      Text(inningsModel[0].wkts!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                                    ],
                                                  ).paddingOnly(left: 2, top: 8.0),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(inningsModel[0].overs!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                                      Text("over", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                                    ],
                                                  ).paddingOnly(left: 8.0),
                                                ],
                                              ).paddingOnly(top: 8.0),
                                            ],
                                          ),
                                          Text(cricketCommentaryInProgressData.bat_team!.name!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                              .paddingOnly(left: 24, top: 4),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("P'Ship:", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                              Text(cricketCommentaryInProgressData.prtshp!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("CRR:", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                              Text(cricketCommentaryInProgressData.crr!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Target:", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                              Text(cricketCommentaryInProgressData.target!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                            ],
                                          )
                                        ],
                                      ).paddingOnly(right: 8.0, top: 16),
                                    ],
                                  ),
                                  Text(cricketSummaryData!.header!.status!, style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium)).paddingOnly(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: PCboxDecoration(bgColor: Cricket_white),
                              child: TabBar(
                                labelPadding: EdgeInsets.only(left: 4.0, right: 4),
                                indicatorWeight: 4.0,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Cricket_Primary,
                                labelColor: Cricket_white,
                                unselectedLabelColor: Cricket_textColorSecondary,
                                tabs: [
                                  Text("SUMMARY", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).center().paddingAll(8),
                                  Text("COMMENTARY", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).fit().center().paddingAll(8),
                                  Text("SCORECARD", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).center().paddingAll(8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : SizedBox(),
          ),
          body: cricketSummaryData != null
              ? TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            width: context.width(),
                            decoration: PCboxDecoration(bgColor: Cricket_Primary),
                            child: Row(
                              children: <Widget>[
                                commonCacheImageWidget(Cricket_ic_default_user, 50, width: 50, fit: BoxFit.cover),
                                10.width,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Cricket_lbl_man_of_the_match, style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontRegular)),
                                    Text("${momModel.isNotEmpty ? momModel[0] : "0"}", style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))
                                  ],
                                ).expand()
                              ],
                            ),
                          ),
                          Container(
                            width: context.width(),
                            decoration: PCboxDecoration(bgColor: Cricket_white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Batsman", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 3),
                                      Text("R", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("B", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("4s", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("6s", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("SR", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                    ],
                                  ).paddingOnly(right: 4),
                                ),
                                Divider(),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: batsmenModel.isNotEmpty ? batsmenModel.length : 0,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      double strikeRate = (int.parse(batsmenModel[index].r!) / int.parse(batsmenModel[index].b!) * 100);
                                      return Container(
                                          padding: EdgeInsets.only(left: 16, top: 4.0, bottom: 4.0, right: 8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text(getPlayerName(batsmenModel[index].id)!, style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                                              Text(batsmenModel[index].r!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                              Text(batsmenModel[index].b!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                              Text(batsmenModel[index].fours!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                              Text(batsmenModel[index].sixes!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                              Text(strikeRate.toStringAsFixed(2).toString(), style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1)
                                            ],
                                          )).onTap(() {
                                        print(index);
                                        setState(() {});
                                      });
                                    }),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16, right: 4.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Bowler", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 3),
                                      Text("O", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("M", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("R", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("W", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).expand(flex: 1),
                                      Text("ER", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium)).paddingOnly(left: 8).expand(flex: 1),
                                    ],
                                  ),
                                ),
                                Divider(),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: bowlerModel.isNotEmpty ? bowlerModel.length : 0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    double bEconomy = (int.parse(bowlerModel[index].r!) / double.parse(bowlerModel[index].o!));
                                    return Container(
                                        padding: EdgeInsets.only(left: 16, right: 8),
                                        child: Row(
                                          children: <Widget>[
                                            Text(getPlayerName(bowlerModel[index].id)!, style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                                            Text(bowlerModel[index].o!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                            Text(bowlerModel[index].m!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                            Text(bowlerModel[index].r!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                            Text(bowlerModel[index].w!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1),
                                            Text(bEconomy.toStringAsFixed(2).toString(), style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 1)
                                          ],
                                        ));
                                  },
                                ),
                                Divider(),
                                Text("Last Wkt: ${cricketCommentaryInProgressData.last_wkt_name}(${cricketCommentaryInProgressData.last_wkt_score})",
                                        style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular))
                                    .paddingOnly(left: 16, top: 4)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: commLineModel.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  width: 25,
                                  height: 25,
                                  decoration:
                                      PCboxDecoration(radius: 15.0, bgColor: commLineModel[index].evt == "six" || commLineModel[index].evt == "four" ? Cricket_Primary : Cricket_Gradient_color1),
                                  child: FittedBox(child: Text(commLineModel[index].evt == "six" ? "6" : "4", style: primaryTextStyle(color: whiteColor, size: 16, fontFamily: fontMedium)))),
                              10.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(parseHtmlString(commLineModel[index].comm.validate(value: 'Huray')),
                                        style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, letterSpacing: .25, fontFamily: fontRegular), textAlign: TextAlign.justify),
                                    Divider(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: PCboxDecoration(radius: 10.0, bgColor: Cricket_white, showShadow: true),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    commonCacheImageWidget(Cricket_head_flag_eng, 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(20).paddingAll(16),
                                    Text("England", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18)).paddingOnly(left: 8.0)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("362-9 (125.4)", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18)).paddingOnly(left: 8.0),
                                    Icon(Icons.keyboard_arrow_right, size: 30, color: Cricket_textColorPrimary).paddingOnly(right: 8.0)
                                  ],
                                ),
                              ],
                            ),
                          ).paddingAll(8).onTap(() {
                            setState(() {
                              PCCricketScoreCardScreen(strTeamName: "England", index: 0).launch(context);
                            });
                          }),
                          Container(
                            width: context.width(),
                            height: context.width() * 0.15,
                            decoration: PCboxDecoration(radius: 10.0, bgColor: Cricket_white, showShadow: true),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    commonCacheImageWidget(Cricket_head_flag_aus, 30, width: 30, fit: BoxFit.cover).cornerRadiusWithClipRRect(20).paddingAll(16),
                                    Text("Australia", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18)).paddingOnly(left: 8.0)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("246-10 (75.2)", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18)).paddingOnly(left: 8.0),
                                    Icon(Icons.keyboard_arrow_right, size: 30, color: Cricket_textColorPrimary).paddingOnly(right: 8.0)
                                  ],
                                ),
                              ],
                            ),
                          ).paddingAll(8).onTap(() {
                            setState(() {
                              PCCricketScoreCardScreen(index: 1, strTeamName: "Australia").launch(context);
                            });
                          }),
                        ],
                      ),
                    ),
                  ],
                )
              : Loader(),
        ),
      ),
    );
  }

  showBottomSheetDialog(context) async {
    showModalBottomSheet(
      backgroundColor: Cricket_white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8),
                    width: context.width(),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_Primary.withOpacity(0.1)),
                    child: Text("Squads", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18))),
                Container(
                    padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(getTeamName(widget.team1), style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Icon(Icons.keyboard_arrow_right, size: 30)
                          ],
                        ).onTap(() {
                          PCCricketPlayerListScreen(teamName: getTeamName(widget.team1), index: cricketTeamList().indexWhere((element) => element.title == getTeamName(widget.team1))).launch(context);
                        }),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(getTeamName(widget.team2), style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Icon(Icons.keyboard_arrow_right, size: 30)
                          ],
                        ).onTap(() {
                          PCCricketPlayerListScreen(teamName: getTeamName(widget.team2), index: cricketTeamList().indexWhere((element) => element.title == getTeamName(widget.team2))).launch(context);
                        }),
                      ],
                    )),
                Container(
                    padding: EdgeInsets.all(8),
                    width: context.width(),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_Primary.withOpacity(0.1)),
                    child: Text("Info", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18))),
                Container(
                    padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_white),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Serices", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                            Text("Date Time", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                            Text("Toss", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                            Text("Umpires", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                            Text("3rd Umpire", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                            Text("Referee", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                          ],
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("The Ashes 2019", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                            Text("22-08-2019 03:30 pm", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                            Text("England elect to bowl", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                            Text("Chirs Gaffaney, Joel Wilson", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                            Text("Kumar Dharmasena", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                            Text("Javagal Srinath", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)),
                          ],
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(8),
                  width: context.width(),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_Primary.withOpacity(0.1)),
                  child: Text("Venue Guide", style: primaryTextStyle(color: Cricket_textColorPrimary, fontFamily: fontMedium, size: 18)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_white),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Stadium", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                          Text("City", style: primaryTextStyle(color: Cricket_textColorSecondary)),
                        ],
                      ),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Headingley").paddingOnly(left: 16, right: 16),
                          Text("Leeds, England").paddingOnly(left: 16, right: 16),
                        ],
                      )
                    ],
                  ),
                ),
                20.height,
              ],
            ),
          ),
        );
      },
    );
  }
}
