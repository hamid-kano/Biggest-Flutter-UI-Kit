import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prokit_flutter/fullApps/mediLab/components/MLCovidTopRegionComponent.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLCovidData.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

import 'MLCovidTopRegionComponent.dart';

class MLVaccineComponent extends StatefulWidget {
  static String tag = '/MLVaccineComponent';

  @override
  MLVaccineComponentState createState() => MLVaccineComponentState();
}

class MLVaccineComponentState extends State<MLVaccineComponent> {
  List<MLCovidData> data = mlCovidCasesDataList();

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
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(12),
          border: Border.all(color: mlColorLightGrey100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.opacity, color: black, size: 24),
                8.width,
                Text('Vaccination progress', style: boldTextStyle(size: 18, color: blackColor)),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('3.6%', style: boldTextStyle(color: Colors.greenAccent, size: 20)),
                    4.height,
                    Text('Fully Vaccinated', style: secondaryTextStyle()),
                  ],
                ).expand(flex: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('7.8%', style: boldTextStyle(color: Colors.cyanAccent, size: 20)),
                    4.height,
                    Text('Received atleast one dose', style: secondaryTextStyle()),
                  ],
                ).expand(flex: 2),
              ],
            ),
            16.height,
            Text('1.143.92M', style: boldTextStyle(color: mlColorBlue, size: 20)),
            4.height,
            Text('Doses Administrated', style: secondaryTextStyle()),
            32.height,
            Divider(height: 5.0),
            16.height,
            Text('Dashboard', style: boldTextStyle(size: 18, color: blackColor)),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  child: CircularPercentIndicator(
                    radius: 90.0,
                    lineWidth: 10.0,
                    percent: 0.8,
                    center: Text('1.3%', style: boldTextStyle(color: Colors.greenAccent, size: 20)),
                    backgroundColor: Colors.greenAccent,
                    progressColor: mlColorDarkBlue,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.brightness_1_rounded, color: Colors.green, size: 16),
                        8.width,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fully Vaccined', style: secondaryTextStyle(size: 16)),
                            4.width,
                            Text('104,124,037 (1.3%)', style: boldTextStyle(size: 14)),
                          ],
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.brightness_1_rounded, color: Colors.cyanAccent, size: 16),
                        8.width,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Received atlease one', style: secondaryTextStyle(size: 16)),
                            4.height,
                            Text('104,124,037 (3.8%)', style: boldTextStyle(size: 14)),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            32.height,
            MLCovidTopRegionComponent(),
            16.height
          ],
        ),
      ).paddingAll(16.0),
    );
  }
}
