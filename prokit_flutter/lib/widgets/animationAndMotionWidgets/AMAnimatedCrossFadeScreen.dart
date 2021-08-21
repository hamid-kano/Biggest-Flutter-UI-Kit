import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMAnimatedCrossFadeScreen extends StatefulWidget {
  static String tag = '/AMAnimatedCrossFadeScreen';

  @override
  AMAnimatedCrossFadeScreenState createState() => AMAnimatedCrossFadeScreenState();
}

class AMAnimatedCrossFadeScreenState extends State<AMAnimatedCrossFadeScreen> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });

      await Future.delayed(Duration(seconds: 3));
      init();
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
          appBar: appBar(context, 'Animated Cross Fade'),
          body: Center(
            child: AnimatedCrossFade(
              duration: Duration(seconds: 3),
              firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150.0),
              secondChild: FlutterLogo(size: 150.0),
              crossFadeState: _crossFadeState,
            ),
          )),
    );
  }
}
