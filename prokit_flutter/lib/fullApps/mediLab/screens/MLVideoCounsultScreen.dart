import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLOnCallComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLVideoConsultScreen extends StatefulWidget {
  @override
  MLVideoConsultScreenState createState() => MLVideoConsultScreenState();
}

class MLVideoConsultScreenState extends State<MLVideoConsultScreen> {
  String call = 'Incoming Call';
  int currentWidget = 0;
  double setOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: Colors.grey,
            decorationImage: DecorationImage(image: AssetImage(ml_ic_video_consult!), fit: BoxFit.fill),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: white.withOpacity(0.0)),
          ),
        ),
        Positioned(
          top: 150,
          child: Column(
            children: [
              CircleAvatar(backgroundColor: Colors.grey, radius: 45.0, backgroundImage: AssetImage(ml_ic_video_consult!)),
              8.height,
              Text('Dr. Stephen Chow', style: boldTextStyle(size: 18, color: whiteColor)),
              8.height,
              Text(call, style: secondaryTextStyle(color: whiteColor))
            ],
          ),
        ),
        Positioned(
          bottom: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  MaterialButton(
                    child: Image.asset(ml_ic_end_call!, width: 50, height: 50),
                    onPressed: () {
                      setState(() {
                        currentWidget++;
                        setOpacity = 0.0;
                        call = 'Decline Call';
                        goBackToMainScreen();
                      });
                    },
                  ),
                  8.height,
                  Text('Reject', style: secondaryTextStyle(color: white))
                ],
              ),
              16.width,
              Column(
                children: [
                  MaterialButton(
                    child: Container(
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Colors.transparent,
                        borderRadius: radius(30),
                        border: Border.all(color: white),
                      ),
                      child: Icon(Icons.chat_outlined, color: white, size: 24).paddingAll(10.0),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  16.height,
                ],
              ),
              16.width,
              Column(
                children: [
                  MaterialButton(
                    child: Image.asset(ml_ic_receive_call!, width: 50, height: 50),
                    onPressed: () {
                      setState(() {
                        currentWidget++;
                        MLOnCallComponent().launch(context);
                      });
                    },
                  ),
                  8.height,
                  Text('Confirm', style: secondaryTextStyle(color: white))
                ],
              ),
            ],
          ).opacity(opacity: setOpacity),
        ),
      ]),
    );
  }

  Future<void> goBackToMainScreen() async {
    await 1.seconds.delay;
    finish(context);
  }
}
