import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class IMGestureDetectorScreen extends StatefulWidget {
  static String tag = '/IMGestureDetectorScreen';

  @override
  _IMGestureDetectorScreenState createState() => _IMGestureDetectorScreenState();
}

class _IMGestureDetectorScreenState extends State<IMGestureDetectorScreen> {
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

  @override
  Widget build(BuildContext context) {
    Widget mImg() {
      return FlutterLogo(
        size: 100,
      );
    }

    Widget mTitle(var value) {
      return Text(
        value,
        style: boldTextStyle(),
      ).paddingOnly(bottom: 16);
    }

    late DragStartDetails startVerticalDragDetails;
    late DragUpdateDetails updateVerticalDragDetails;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Gesture Detector'),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mTitle(
                "Simple Tap",
              ),
              GestureDetector(
                onTap: () {
                  toast("Simple Tap");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Double Tap",
              ),
              GestureDetector(
                onDoubleTap: () {
                  toast("Double Tap");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Long press",
              ),
              GestureDetector(
                onLongPress: () {
                  toast("Long press");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Swipe",
              ),
              GestureDetector(
                onPanStart: (details) {
                  toast("onPan started");
                },
                onPanEnd: (details) {
                  toast("onPan ended");
                },
                child: mImg(),
              ).center(),
              Divider(color: appDividerColor).paddingOnly(top: 16, bottom: 16),
              mTitle(
                "Vertical swipe ",
              ),
              GestureDetector(
                      onVerticalDragStart: (dragDetails) {
                        startVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragUpdate: (dragDetails) {
                        updateVerticalDragDetails = dragDetails;
                      },
                      onVerticalDragEnd: (endDetails) {
                        double dx = updateVerticalDragDetails.globalPosition.dx - startVerticalDragDetails.globalPosition.dx;
                        double dy = updateVerticalDragDetails.globalPosition.dy - startVerticalDragDetails.globalPosition.dy;
                        double velocity = endDetails.primaryVelocity!;

                        //Convert values to be positive
                        if (dx < 0) dx = -dx;
                        if (dy < 0) dy = -dy;

                        if (velocity < 0) {
                          toast(" Swipe Up");
                        } else {
                          toast(" Swipe Down ");
                        }
                      },
                      child: mImg())
                  .center(),
            ],
          ),
        ),
      ),
    );
  }
}
