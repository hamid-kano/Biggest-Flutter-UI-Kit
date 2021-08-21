import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/customPaint/customLoader/CustomLoaderPainter.dart';

class CustomLoaderScreen extends StatefulWidget {
  @override
  CustomLoaderScreenState createState() => CustomLoaderScreenState();
}

class CustomLoaderScreenState extends State<CustomLoaderScreen> with SingleTickerProviderStateMixin {
  double percentValue = 0.0;
  double newPercentage = 0.0;
  AnimationController? _percentValueAnimationController;
  double? _height;
  double? _width;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setState(() {
      percentValue = 0.0;
    });
    _percentValueAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          percentValue = lerpDouble(percentValue, newPercentage, _percentValueAnimationController!.value)!;
        });
      });
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget('Custom Loader', center: true, color: context.scaffoldBackgroundColor),
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomPainterExampleWidgets.buildButtonAnimation(
              height: _height! / 2,
              width: _width! / 2,
              percentValue: percentValue,
              onPress: () {
                setState(
                  () {
                    percentValue = newPercentage;
                    newPercentage += 10;
                    if (newPercentage > 100.0) {
                      percentValue = 0.0;
                      newPercentage = 0.0;
                    }
                    _percentValueAnimationController!.forward(from: 0.0);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomPainterExampleWidgets {
  static Widget buildButtonAnimation({required double height, required double width, required double percentValue, required Function onPress}) {
    return Center(
      child: Container(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: CustomLoaderPainter(buttonBorderColor: Colors.grey[300], progressColor: Colors.blue, percentage: percentValue, width: 8.0),
          child: AppButton(
            color: Colors.red,
            splashColor: Colors.redAccent,
            shapeBorder: CircleBorder(),
            onTap: onPress,
            child: Text(
              "Press\n  ${percentValue.toInt()}%",
              style: boldTextStyle(size: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ).paddingAll(8.0),
        ),
      ),
    );
  }
}
