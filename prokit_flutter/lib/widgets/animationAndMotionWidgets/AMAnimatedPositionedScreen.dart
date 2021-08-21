import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMAnimatedPositionedScreen extends StatefulWidget {
  static String tag = '/AMAnimatedPositionedScreen';

  @override
  AMAnimatedPositionedScreenState createState() => AMAnimatedPositionedScreenState();
}

class AMAnimatedPositionedScreenState extends State<AMAnimatedPositionedScreen> {
  double mLeftPosition = 0;
  double mRightPosition = 0;
  double mTopPosition = 0;
  double mBottomPosition = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Animated Positioned'),
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedPositioned(
                left: mLeftPosition,
                right: mRightPosition,
                top: mTopPosition,
                bottom: mBottomPosition,
                duration: Duration(milliseconds: 300),
                child: Center(
                    child: FlutterLogo(
                  size: 150,
                )),
              ),
              Positioned(
                bottom: 60,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        setState(() {
                          mLeftPosition = 0;
                          mRightPosition = 0;
                          mTopPosition = 0;
                          mBottomPosition = 120;
                        });
                      },
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                    10.width,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        setState(() {
                          mLeftPosition = 120;
                          mRightPosition = 0;
                          mTopPosition = 0;
                          mBottomPosition = 0;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    ),
                    10.width,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        setState(() {
                          mLeftPosition = 0;
                          mRightPosition = 0;
                          mTopPosition = 120;
                          mBottomPosition = 0;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ),
                    10.width,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        setState(() {
                          mLeftPosition = 0;
                          mRightPosition = 120;
                          mTopPosition = 0;
                          mBottomPosition = 0;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
