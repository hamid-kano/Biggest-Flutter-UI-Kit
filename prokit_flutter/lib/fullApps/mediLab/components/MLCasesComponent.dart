import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCovidTopRegionComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MLCasesComponent extends StatefulWidget {
  static String tag = '/MLCasesComponent';

  @override
  MLCasesComponentState createState() => MLCasesComponentState();
}

class MLCasesComponentState extends State<MLCasesComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget mOption(String heading, String subHeading, var color) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: secondaryTextStyle(color: black)),
          6.height,
          Row(
            children: [
              Icon(Icons.adjust_rounded, size: 16, color: color),
              Text(subHeading, style: primaryTextStyle(size: 14, color: mlColorBlue)),
            ],
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Cases', style: boldTextStyle(size: 14)),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('152.799.358', style: boldTextStyle(size: 24)),
              4.width,
              Text('+523.233', style: secondaryTextStyle(size: 12)).paddingBottom(4.0),
            ],
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mOption('Actives', '50.830k', mlColorBlue),
              mOption('Deaths', '50.830k', mlColorRed),
              mOption('Recovered', '50.830k', Colors.greenAccent),
            ],
          ),
          32.height,
          MLCovidTopRegionComponent(),
          16.height,
        ],
      ).paddingAll(16.0),
    );
  }
}
