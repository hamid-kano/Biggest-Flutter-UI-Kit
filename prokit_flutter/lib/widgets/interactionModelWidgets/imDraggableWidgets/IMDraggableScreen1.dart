import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMDraggableScreen1 extends StatefulWidget {
  static String tag = '/IMDraggableScreen1';

  @override
  _IMDraggableScreen1State createState() => _IMDraggableScreen1State();
}

class _IMDraggableScreen1State extends State<IMDraggableScreen1> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  var mData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Simple Draggable'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Simple Draggable",
              style: boldTextStyle(),
            ).paddingOnly(bottom: 2),
            Text(
              "Widget movable around the screen",
              style: secondaryTextStyle(),
            ).paddingOnly(bottom: 16),
            Center(
              child: Draggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  size: 100,
                ),
                childWhenDragging: Container(),
              ),
            ),
            Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
            Text(
              "Custom Draggable",
              style: boldTextStyle(),
            ).paddingOnly(bottom: 2),
            Text(
              "widget to be displayed in the original position & Widget is being dragged",
              style: secondaryTextStyle(),
            ).paddingOnly(bottom: 16),
            Center(
              child: Draggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Center(
                  child: Draggable(
                    child: FlutterLogo(
                      size: 100,
                    ),
                    feedback: FlutterLogo(
                      style: FlutterLogoStyle.stacked,
                      size: 100,
                    ),
                    childWhenDragging: Container(),
                  ),
                ),
              ),
            ),
            Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
            Text(
              "Custom Draggable",
              style: boldTextStyle(),
            ).paddingOnly(bottom: 2),
            Text(
              "widget must be changed when dragged",
              style: secondaryTextStyle(),
            ).paddingOnly(bottom: 16),
            Center(
              child: Draggable(
                child: FlutterLogo(
                  size: 100,
                ),
                feedback: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100,
                ),
                childWhenDragging: Container(),
              ),
            ),
            Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
            Text(
              "Horizontal Draggable",
              style: boldTextStyle(),
            ).paddingOnly(bottom: 16),
            Draggable(
              axis: Axis.horizontal,
              child: FlutterLogo(
                size: 100,
              ),
              feedback: FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 100,
              ),
              childWhenDragging: Container(),
            ).center(),
            Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
            Text(
              "Vertical Draggable",
              style: boldTextStyle(),
            ).paddingOnly(bottom: 16),
            Draggable(
              axis: Axis.vertical,
              child: FlutterLogo(
                size: 100,
              ),
              feedback: FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 100,
              ),
              childWhenDragging: Container(),
            ).center(),
          ],
        ),
      ),
    );
  }
}
