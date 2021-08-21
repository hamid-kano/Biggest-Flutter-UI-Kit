import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PETransformScreen extends StatefulWidget {
  static String tag = '/PETransformScreen';

  @override
  PETransformScreenState createState() => PETransformScreenState();
}

class PETransformScreenState extends State<PETransformScreen> {
  double rotateValue = 11.0;
  double scaleValue = 1;
  double offsetX = 0;

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
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Transform'),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transform Rotate', style: boldTextStyle()).paddingBottom(20),
              20.height,
              Transform.rotate(angle: rotateValue, child: Container(height: 100.0, width: 100.0, color: Colors.pink)).center(),
              Text('Value : ${rotateValue.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(25),
              Slider(
                inactiveColor: appStore.textPrimaryColor,
                activeColor: Colors.pink,
                max: 15,
                min: 1,
                value: rotateValue,
                onChanged: (val) {
                  setState(() {
                    rotateValue = val;
                  });
                },
              ),
              Text('Transform Scale', style: boldTextStyle()).paddingBottom(35),
              Transform.scale(
                scale: scaleValue,
                child: Container(height: 100.0, width: 100.0, color: Colors.blue),
              ).center(),
              Text('Value : ${scaleValue.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(35),
              Slider(
                activeColor: Colors.blue,
                inactiveColor: appStore.textPrimaryColor,
                max: 1.5,
                min: 0.5,
                value: scaleValue,
                onChanged: (val) {
                  setState(() {
                    scaleValue = val;
                  });
                },
              ),
              Text('Transform Translate', style: boldTextStyle()).paddingBottom(20),
              Transform.translate(
                offset: Offset(offsetX, 0.0),
                child: Container(height: 100, width: 100, color: Colors.green),
              ).center(),
              Text('Value : ${offsetX.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(25),
              Slider(
                activeColor: Colors.green,
                inactiveColor: appStore.textPrimaryColor,
                max: 100,
                min: 0,
                value: offsetX,
                onChanged: (val) {
                  setState(() {
                    offsetX = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
