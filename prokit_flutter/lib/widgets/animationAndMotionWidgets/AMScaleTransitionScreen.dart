import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';

class AMScaleTransitionScreen extends StatefulWidget {
  static String tag = '/AMScaleTransitionScreen';

  @override
  AMScaleTransitionScreenState createState() => AMScaleTransitionScreenState();
}

class AMScaleTransitionScreenState extends State<AMScaleTransitionScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        appBar: appBar(context, 'ScaleTransition'),
        body: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
