import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class PEBackdropFilterScreen extends StatefulWidget {
  static String tag = '/PEBackdropFilterScreen';

  @override
  PEBackdropFilterScreenState createState() => PEBackdropFilterScreenState();
}

class PEBackdropFilterScreenState extends State<PEBackdropFilterScreen> {
  double xAxis = 3.0;
  double yAxis = 0.0;

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
        appBar: appBar(context, 'Backdrop filter'),
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis), child: Container(color: Colors.white.withOpacity(0.2))),
              ).paddingOnly(top: 25, bottom: 25),
              Column(
                children: [
                  Row(
                    children: [
                      Text('X Axis: ', style: boldTextStyle()),
                      Slider(
                        inactiveColor: appStore.textPrimaryColor,
                        activeColor: appColorPrimary,
                        max: 10,
                        min: 0,
                        value: xAxis,
                        onChanged: (val) {
                          setState(() {
                            xAxis = val;
                          });
                        },
                      ).expand(),
                      Text('Value: ${xAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Y Axis: ', style: boldTextStyle()),
                      Slider(
                        inactiveColor: appStore.textPrimaryColor,
                        activeColor: appColorPrimary,
                        max: 10,
                        min: 0,
                        value: yAxis,
                        onChanged: (val) {
                          setState(() {
                            yAxis = val;
                          });
                        },
                      ).expand(),
                      Text('Value: ${yAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
