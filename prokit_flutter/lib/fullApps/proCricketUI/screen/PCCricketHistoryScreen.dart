import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCHistoryData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCCricketHistoryScreen extends StatefulWidget {
  static String tag = '/CricketHistory';

  @override
  _PCCricketHistoryScreenState createState() => _PCCricketHistoryScreenState();
}

class _PCCricketHistoryScreenState extends State<PCCricketHistoryScreen> {
  List<History>? historyModel = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/history.json');
    PCHistoryData cricketHistoryData = PCHistoryData.fromJson(jsonDecode(json));
    historyModel = cricketHistoryData.history;
    print(historyModel!.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_white,
      appBar: PreferredSize(preferredSize: Size(double.infinity, 350), child: headerView(Cricket_lbl_History, context)),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: historyModel!.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(historyModel![index].year!, style: primaryTextStyle(color: Cricket_Primary, size: 16, fontFamily: fontMedium)).paddingOnly(left: 4),
                        Align(alignment: Alignment.center, child: Container(width: 1.0, height: 60, decoration: PCboxDecoration(bgColor: Colors.redAccent))),
                        RotatedBox(
                            quarterTurns: -1,
                            child: Text("${historyModel![index].champion} vs ${historyModel![index].runnersUp}", style: primaryTextStyle(color: Cricket_Primary, size: 12, fontFamily: fontRegular))),
                        Align(alignment: Alignment.center, child: Container(width: 1.0, height: 60, decoration: PCboxDecoration(bgColor: Colors.redAccent))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: boxDecorationRoundedWithShadow(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  child: commonCacheImageWidget(getHistoryTeamImg(historyModel![index].year), 200, width: context.width(), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: context.width(),
                                    decoration: PCboxDecoration(radius: 0, bgColor: Cricket_BlackColor.withOpacity(0.75)),
                                    child: Text(historyModel![index].result!, style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontRegular)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(historyModel![index].champion!, style: primaryTextStyle(size: 16)),
                                    Text(historyModel![index].teamOneScore!, style: primaryTextStyle(size: 16)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(historyModel![index].runnersUp!, style: primaryTextStyle(size: 16)),
                                    Text(historyModel![index].teamTwoScore!, style: primaryTextStyle(size: 16)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 6,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
