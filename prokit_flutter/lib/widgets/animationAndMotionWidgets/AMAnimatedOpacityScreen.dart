import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMAnimatedOpacityScreen extends StatefulWidget {
  static String tag = '/AMAnimatedOpacityScreen';

  @override
  AMAnimatedOpacityScreenState createState() => AMAnimatedOpacityScreenState();
}

class AMAnimatedOpacityScreenState extends State<AMAnimatedOpacityScreen> {
  double opacityLevel1 = 1.0;
  double opacityLevel2 = 0.2;
  double opacityLevel3 = 0.5;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacityLevel1 = opacityLevel1 == 0 ? 1.0 : 0.1;
        opacityLevel2 = opacityLevel2 == 0 ? 0.1 : 0.6;
        opacityLevel3 = opacityLevel3 == 0 ? 0.2 : 1.0;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'Animated Opacity'),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: opacityLevel2,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 130,
                ),
              ),
              16.height,
              AnimatedOpacity(
                opacity: opacityLevel1,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 130,
                ),
              ),
              16.height,
              AnimatedOpacity(
                opacity: opacityLevel3,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 130,
                ),
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
