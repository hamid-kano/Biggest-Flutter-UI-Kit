import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCCommentaryPreviewData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketPlayerListScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCDataGenerator.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class PCCricketMatchInPreviewScreen extends StatefulWidget {
  static String tag = '/CricketMatchInPreview';

  String? team1 = "";
  String? team2 = "";

  PCCricketMatchInPreviewScreen({this.team1, this.team2});

  @override
  _PCCricketMatchInPreviewScreenState createState() => _PCCricketMatchInPreviewScreenState();
}

class _PCCricketMatchInPreviewScreenState extends State<PCCricketMatchInPreviewScreen> {
  List<CommLine> commLineModel = [];
  late PCCommentaryPreviewData cricketMatchInPreviewData;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/CommentaryPreview.json');
    cricketMatchInPreviewData = PCCommentaryPreviewData.fromJson(jsonDecode(json));

    commLineModel.addAll(cricketMatchInPreviewData.comm_lines!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Cricket_white,
        appBar: PreferredSize(
            preferredSize: Size(context.width(), 350),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    commonCacheImageWidget(Cricket_ic_gradient, 100, width: context.width(), fit: BoxFit.cover),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.arrow_back, size: 25, color: Cricket_white).paddingOnly(top: 28.0, left: 8).onTap(() {
                              finish(context);
                            }),
                            Text("${getTeamName(widget.team1)} vs ${getTeamName(widget.team2)}", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                .paddingOnly(left: 16, right: 8, top: 28.0),
                          ],
                        ),
                        Icon(Icons.info_outline, color: Cricket_white).paddingOnly(top: 28.0, right: 8.0).onTap(() {
                          showBottomSheetDialog(context);
                        })
                      ],
                    ).paddingOnly(top: 16),
                  ],
                ),
                Container(
                  height: 220,
                  decoration: PCboxDecoration(bgColor: Cricket_white),
                  child: Stack(
                    children: <Widget>[
                      commonCacheImageWidget(Cricket_ic_lord_london, 220, width: context.width(), fit: BoxFit.cover),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: PCboxDecoration(bgColor: Cricket_Primary.withOpacity(0.75)),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.asset(Cricket_ic_default_placeholder, height: 60, width: 60, fit: BoxFit.fill),
                                        10.width,
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("0", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                                Text("-", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)).paddingOnly(left: 4, right: 4),
                                                Text("0", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("0", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium)),
                                                5.width,
                                                Text("Over", style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontMedium))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text("Starts in 10 hrs 39 mins", style: primaryTextStyle(color: Cricket_white, size: 16, fontFamily: fontSemiBold)).paddingOnly(top: 32),
                          ],
                        ).paddingOnly(top: 32),
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
                            Text("COMMENTARY", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).center().paddingAll(8),
                            Text("SCORECARD", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontMedium)).center().paddingAll(8),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                commonCacheImageWidget(Cricket_ic_Preview, 100, width: context.width(), fit: BoxFit.cover),
                Text("Match yet to start", style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontSemiBold)).paddingOnly(top: 10),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: commLineModel.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            parseHtmlString(commLineModel[index].comm),
                            style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontMedium),
                          ).paddingOnly(left: 8, right: 8, top: 16),
                          Divider(),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(left: 8, right: 8);
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                commonCacheImageWidget(Cricket_ic_Preview, 100, width: context.width(), fit: BoxFit.cover),
                Text("Match yet to start", style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontSemiBold)).paddingOnly(top: 10),
              ],
            ),
          ],
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
                    child: Text("Squads", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 18, fontFamily: fontRegular))),
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
                    child: Text("Info", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 18, fontFamily: fontRegular))),
                Container(
                    padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_white),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Serices", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("Date Time", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("Toss", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("Umpires", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("3rd Umpire", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("Referee", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                          ],
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("The Ashes 2019", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Text("22-08-2019 03:30 pm", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Text("England elect to bowl", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Text("Chirs Gaffaney, Joel Wilson", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Text("Kumar Dharmasena", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                            Text("Javagal Srinath", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16, fontFamily: fontRegular)),
                          ],
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(8),
                  width: context.width(),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_Primary.withOpacity(0.1)),
                  child: Text("Venue Guide", style: primaryTextStyle(color: Cricket_textColorPrimary, size: 18, fontFamily: fontRegular)),
                ),
                Container(
                    padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_white),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Stadium", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
                            Text("City", style: primaryTextStyle(color: Cricket_textColorSecondary, size: 16, fontFamily: fontRegular)),
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
                    )),
                20.height,
              ],
            ),
          ),
        );
      },
    );
  }
}
