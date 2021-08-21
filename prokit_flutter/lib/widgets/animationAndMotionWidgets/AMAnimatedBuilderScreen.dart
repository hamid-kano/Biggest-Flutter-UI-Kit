import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class AMAnimatedBuilderScreen extends StatefulWidget {
  static String tag = '/AMAnimatedBuilderScreen';

  @override
  AMAnimatedBuilderScreenState createState() => AMAnimatedBuilderScreenState();
}

class AMAnimatedBuilderScreenState extends State<AMAnimatedBuilderScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: non_constant_identifier_names
  late Animation _FavouriteAnimation;
  AnimationController? _arrowAnimationController, _favouriteAnimationController;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _favouriteAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1200))..repeat();
    _FavouriteAnimation = Tween(begin: 80.0, end: 100.0).animate(CurvedAnimation(curve: Curves.bounceOut, parent: _favouriteAnimationController!));

    _favouriteAnimationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _favouriteAnimationController!.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _arrowAnimationController?.dispose();
    _favouriteAnimationController?.dispose();
    super.dispose();
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
        appBar: appBar(context, 'Animated Builder'),
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rotate Animation",
                  style: boldTextStyle(),
                ).paddingBottom(16),
                30.height,
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    decoration: boxDecoration(radius: 8, bgColor: Colors.blueGrey),
                    height: 150,
                    width: 150,
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  },
                ).center(),
                60.height,
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                    width: 150,
                    height: 150,
                    child: FlutterLogo(),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value - math.pi / 12.0,
                      child: child,
                    );
                  },
                ).center(),
                30.height,
                Text(
                  "Favourite Animation",
                  style: boldTextStyle(),
                ).paddingBottom(16),
                16.height,
                AnimatedBuilder(
                  animation: _favouriteAnimationController!,
                  builder: (context, child) {
                    return Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _FavouriteAnimation.value,
                    );
                  },
                ).center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
