import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/model/PCDashboardModel.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/screen/PCCricketMatchListScreen.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCColors.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCDataGenerator.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCStrings.dart';
import 'package:prokit_flutter/fullApps/proCricketUI/utils/PCWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PCCricketVenueScreen extends StatefulWidget {
  static String tag = '/CricketVenue';

  @override
  _PCCricketVenueScreenState createState() => _PCCricketVenueScreenState();
}

class _PCCricketVenueScreenState extends State<PCCricketVenueScreen> {
  late List<CricketGroundModel> mList1;

  @override
  // ignore: must_call_super
  void initState() {
    mList1 = cricketVenueList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 350),
        child: headerView(Cricket_lbl_Venue, context),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mList1.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: boxDecorationRoundedWithShadow(10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Stack(
                      children: <Widget>[
                        commonCacheImageWidget(mList1[index].img, 160, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topRight: 10, topLeft: 10),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: context.width(),
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationWithRoundedCorners(
                                backgroundColor: Cricket_BlackColor.withOpacity(0.75), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
                            child: Text(mList1[index].ground, style: primaryTextStyle(color: Cricket_white)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Cricket_white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("No of matches: ${mList1[index].matches}", style: primaryTextStyle()),
                        Text("Capacity: ${mList1[index].capacity}", style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ],
              ),
            ).onTap(
              () {
                PCCricketMatchListScreen(groundName: mList1[index].ground).launch(context);
                setState(() {});
              },
            ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
          },
        ),
      ),
    );
  }
}
