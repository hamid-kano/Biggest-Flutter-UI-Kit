import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_fluid_slider/flutter_fluid_slider.dart';

class FluidSliderScreen extends StatefulWidget {
  static String tag = '/FluidSliderScreen';

  @override
  FluidSliderScreenState createState() => FluidSliderScreenState();
}

class FluidSliderScreenState extends State<FluidSliderScreen> {
  double value = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Slider"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FluidSlider(
            start: Text('0',style: primaryTextStyle(color: white)),
            end: Text('100',style: primaryTextStyle(color: white)),
            value: value,
            labelsTextStyle: primaryTextStyle(),
            valueTextStyle: primaryTextStyle(color: textPrimaryColor),
            onChanged: (double newValue) {
              setState(() {
                value = newValue;
              });
            },
            min: 0.0,
            max: 100.0,
          ),
        ],
      ).paddingAll(8),
    );
  }
}
