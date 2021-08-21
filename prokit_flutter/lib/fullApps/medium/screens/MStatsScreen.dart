import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MColors.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MWidget.dart';

// ignore: must_be_immutable
class MStatsScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mGreyColor,
        key: scaffoldKey,
        drawer: Drawer(
          child: SideDrawer(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              openDrawer();
            },
            color: white,
          ),
          backgroundColor: black,
          title: Text("Stats"),
        ),
        body: Container(
          color: black,
          height: 150,
          width: context.width(),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello", style: boldTextStyle(color: white, size: 20)).expand(),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createRichText(list: [
                      TextSpan(text: "Views\n", style: primaryTextStyle(color: grey)),
                      TextSpan(text: "0", style: primaryTextStyle(color: white)),
                    ]),
                    VerticalDivider(color: grey, thickness: 1),
                    createRichText(
                      list: [
                        TextSpan(text: "Reads\n", style: primaryTextStyle(color: grey)),
                        TextSpan(text: "0", style: primaryTextStyle(color: white)),
                      ],
                    ),
                    VerticalDivider(color: grey, thickness: 1),
                    createRichText(list: [
                      TextSpan(text: "Ratio\n", style: primaryTextStyle(color: grey)),
                      TextSpan(text: "0%", style: primaryTextStyle(color: white)),
                    ]),
                    VerticalDivider(color: grey, thickness: 1),
                    createRichText(list: [
                      TextSpan(text: "Fans\n", style: primaryTextStyle(color: grey)),
                      TextSpan(text: "0", style: primaryTextStyle(color: white)),
                    ]),
                  ],
                ).paddingBottom(24),
              )
            ],
          ),
        ).paddingTop(8),
      ),
    );
  }
}
