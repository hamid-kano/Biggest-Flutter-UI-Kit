import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCPointTableData.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCCricketPointTableScreen extends StatefulWidget {
  static String tag = '/CricketPointTable';

  @override
  _PCCricketPointTableScreenState createState() => _PCCricketPointTableScreenState();
}

class _PCCricketPointTableScreenState extends State<PCCricketPointTableScreen> {
  List<Team> pointTable = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/pointtable.json');
    PCPointTableData cricketPointTableData = PCPointTableData.fromJson(jsonDecode(json));
    pointTable.addAll(cricketPointTableData.group!.teams!);
    print(pointTable.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(preferredSize: Size(double.infinity, 350), child: headerView(Cricket_lbl_Point_Table, context)),
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                commonCacheImageWidget(Cricket_ic_gradient, 60, fit: BoxFit.fill, width: context.width()),
                Container(
                  width: context.width(),
                  height: 60,
                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(0), backgroundColor: Cricket_BlackColor.withOpacity(0.5)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                  width: context.width(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(flex: 4, child: Text('Team', style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 1, child: Text("Pid", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 1, child: Text("Won", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 1, child: Text("Lost", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 1, child: Text("Tied", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 2, child: Text("Net RR", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium))),
                      Expanded(flex: 1, child: Text("Pts", style: boldTextStyle(color: Cricket_white, size: 16, fontFamily: fontMedium)))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: pointTable.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  color: (index.isEven ? Cricket_white : Colors.grey.withOpacity(0.2)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          commonCacheImageWidget(getHeaderFlag(pointTable[index].sName), 25, width: 25, fit: BoxFit.cover).cornerRadiusWithClipRRect(15.0),
                          10.width,
                          Expanded(child: Text(pointTable[index].name!, style: boldTextStyle(color: Cricket_textColorPrimary, size: 16)))
                        ],
                      ).expand(flex: 4),
                      Expanded(flex: 1, child: Text(pointTable[index].p!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16))),
                      Expanded(flex: 1, child: Text(pointTable[index].w!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16))),
                      Expanded(flex: 1, child: Text(pointTable[index].l!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16))),
                      Expanded(flex: 1, child: Text(pointTable[index].t!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16))),
                      Expanded(flex: 2, child: Text(pointTable[index].nr!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16))),
                      Expanded(flex: 1, child: Text(pointTable[index].points!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 16)))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
