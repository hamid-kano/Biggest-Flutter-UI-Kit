import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCScoreCardData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCSummaryData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketPlayerInfoScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';

// ignore: must_be_immutable
class PCCricketScoreCardScreen extends StatefulWidget {
  static String tag = '/CricketScoreCard';
  String? strTeamName;
  int? index;

  PCCricketScoreCardScreen({this.strTeamName, this.index});

  @override
  _PCCricketScoreCardScreenState createState() => _PCCricketScoreCardScreenState();
}

class _PCCricketScoreCardScreenState extends State<PCCricketScoreCardScreen> {
  PCScoreCardData? cricketScoreCardData;
  late PCSummaryData cricketSummaryData;
  List<Batsmen> batsmenModel = [];
  List<Bowler> bowlerModel = [];
  List<Fow> fowModel = [];
  List<Player> playerModel = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/scorecard.json');
    cricketScoreCardData = PCScoreCardData.fromJson(jsonDecode(json));
    String json2 = await rootBundle.loadString('assets/cricket_data/Summary.json');
    cricketSummaryData = PCSummaryData.fromJson(jsonDecode(json2));
    playerModel.addAll(cricketSummaryData.players!);
    batsmenModel.addAll(cricketScoreCardData!.innings![widget.index!].batsmen!);
    bowlerModel.addAll(cricketScoreCardData!.innings![widget.index!].bowlers!);
    fowModel.addAll(cricketScoreCardData!.innings![widget.index!].fow!);
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

    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(preferredSize: Size(double.infinity, 350), child: headerView(widget.strTeamName, context)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: cricketScoreCardData != null
              ? Column(
                  children: <Widget>[
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 4),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        children: <Widget>[
                          Text("Batsman", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                          Text("R", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("B", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("4s", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("6s", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("SR", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 8).expand(),
                        ],
                      ),
                    ),
                    5.height,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: batsmenModel.isNotEmpty ? batsmenModel.length : 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(getPlayerName(batsmenModel[index].id)!, style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                                    Text(batsmenModel[index].r!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(),
                                    Text(batsmenModel[index].b!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(),
                                    Text(batsmenModel[index].fours!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                                    Text(batsmenModel[index].sixes!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                                    Text((int.parse(batsmenModel[index].r!) / int.parse(batsmenModel[index].b!) * 100).toStringAsFixed(2).toString(),
                                            style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                                        .expand(),
                                  ],
                                ),
                                Text(batsmenModel[index].out_desc!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(top: 4, bottom: 4),
                                Divider()
                              ],
                            )).onTap(
                          () {
                            PCCricketPlayerInfoScreen().launch(context);
                          },
                        );
                      },
                    ),
                    Container(
                      width: context.width(),
                      //height: 40,
                      padding: EdgeInsets.only(left: 16),
                      child: Row(
                        children: <Widget>[
                          Text("Extras", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                          Text("T${cricketScoreCardData!.innings![widget.index!].extras!.t}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 4)
                              .expand(),
                          Text("b${cricketScoreCardData!.innings![widget.index!].extras!.b}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 4)
                              .expand(),
                          Text("lb${cricketScoreCardData!.innings![widget.index!].extras!.lb}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 4)
                              .expand(),
                          Text("w${cricketScoreCardData!.innings![widget.index!].extras!.wd}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 4)
                              .expand(),
                          Text("nb${cricketScoreCardData!.innings![widget.index!].extras!.nb}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 4)
                              .expand(),
                          Text("p${cricketScoreCardData!.innings![widget.index!].extras!.p}", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium))
                              .paddingOnly(left: 8)
                              .expand(),
                        ],
                      ).paddingOnly(right: 4),
                    ),
                    Divider(),
                    Container(
                      width: context.width(),
                      //height: 40,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Text("Total", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                          Text(
                            "${cricketScoreCardData!.innings![widget.index!].score}(${cricketScoreCardData!.innings![widget.index!].wkts}wkts,${cricketScoreCardData!.innings![1].ovr} Ov)",
                            style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      width: context.width(),
                      //height: context.width() * 0.12,
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 4),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        children: <Widget>[
                          Text("Bowler", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 3),
                          Text("O", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("M", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("R", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("W", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4).expand(),
                          Text("ER", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 8).expand(),
                        ],
                      ),
                    ),
                    Container(
                      width: context.width(),
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 4),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        children: <Widget>[
                          Text("Total", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(flex: 4),
                          Text("Score", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(),
                          Text("Over", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).expand(),
                        ],
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: fowModel.isNotEmpty ? fowModel.length : 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print(index);
                            setState(() {
                              PCCricketPlayerInfoScreen().launch(context);
                            });
                          },
                          child: Container(
                            width: context.width(),
                            //height: context.width() * 0.12,
                            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 3, child: Text(getPlayerName(fowModel[index].id)!, style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontMedium))),
                                Expanded(flex: 1, child: Text(fowModel[index].score!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 24)),
                                Expanded(flex: 0, child: Text(fowModel[index].over!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).paddingOnly(right: 24)),
                              ],
                            ).paddingOnly(right: 4),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Loader().center(),
        ),
      ),
    );
  }
}
