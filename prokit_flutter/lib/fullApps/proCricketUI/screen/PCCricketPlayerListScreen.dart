import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCPlayerListModel.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketPlayerInfoScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCConstant.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCImages.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

// ignore: must_be_immutable
class PCCricketPlayerListScreen extends StatefulWidget {
  static String tag = '/CricketPlayerList';
  String? teamName = "";
  int? index = 0;

  PCCricketPlayerListScreen({this.teamName, this.index});

  @override
  _PCCricketPlayerListScreenState createState() => _PCCricketPlayerListScreenState();
}

class _PCCricketPlayerListScreenState extends State<PCCricketPlayerListScreen> {
  PCPlayerListModel model = PCPlayerListModel(cricket_Team: []);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/cricket_data/Cricket_team.json');

    model = PCPlayerListModel.fromJson(jsonDecode(json));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setIcon(String? role, bool? isCaption, bool? isWk) {
      if (role == "Batsman" && isCaption == true)
        return Cricket_ic_Caption;
      else if (role == "Bowler" && isCaption == true)
        return Cricket_ic_Caption;
      else if (role == "Bowling All-Rounder" && isCaption == true)
        return Cricket_ic_Caption;
      else if (role == "Bowling All-Rounder" && isCaption == true)
        return Cricket_ic_Caption;
      else if (role == "WK-Batsman" && isCaption == true)
        return Cricket_ic_Caption;
      else if (role == "WK-Batsman" && isWk == true)
        return Cricket_ic_wk;
      else if (role == "Bowler")
        return Cricket_ic_bowler;
      else if (role == "Batsman")
        return Cricket_ic_batsman;
      else if (role == "WK-Batsman")
        return Cricket_ic_wk;
      else if (role == "Bowling All-Rounder" || role == "Batting All-Rounder") return Cricket_ic_all_rounder;
    }

    return Scaffold(
      backgroundColor: Cricket_white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.width() * 0.22),
        child: headerView(widget.teamName.validate(), context),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: model.cricket_Team!.isNotEmpty ? model.cricket_Team![widget.index!].teamPlayers!.length : 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            TeamPlayer player = model.cricket_Team![widget.index!].teamPlayers![index];
            return GestureDetector(
              onTap: () {
                print(index);
                setState(() {
                  print("Selected");
                  PCCricketPlayerInfoScreen().launch(context);
                });
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    commonCacheImageWidget(Cricket_ic_profile, context.width() * 0.15, width: context.width() * 0.15, fit: BoxFit.fill)
                        .cornerRadiusWithClipRRect(10.0)
                        .paddingOnly(top: 8, left: 8, bottom: 8),
                    Container(
                      height: context.width() * 0.15,
                      width: context.width() * 0.78,
                      decoration: PCboxDecoration(radius: 10.0, bgColor: Cricket_Primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(player.playerName.validate(), style: primaryTextStyle(color: Cricket_white, size: 18, fontFamily: fontSemiBold)).paddingOnly(left: 16),
                          commonCacheImageWidget(setIcon(player.role.validate(), player.isCaptain.validate(), player.isWicketKeeper.validate()), 30, width: 30).center().paddingOnly(right: 8),
                        ],
                      ),
                    ).paddingAll(8)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
