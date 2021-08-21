import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLMedicineInformationComponent extends StatefulWidget {
  static String tag = '/MLMedicineInformationComponent';

  @override
  MLMedicineInformationComponentState createState() => MLMedicineInformationComponentState();
}

class MLMedicineInformationComponentState extends State<MLMedicineInformationComponent> {
  List<String?> time = <String?>[
    '08:30 am',
    '15:30 am',
    '20:30 am',
    '',
  ];
  String? medicineName = 'Probitic, 250mg';
  String? numberOfTablet = '1 tablet per time - Total 60 Tablet';
  String? numberOfTime = '30 mins before meal';
  String? duration = '6 weeks- From 23 Sep to 30 Oct';
  String? tabletsTaken = '35/60 Tablet';

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
      padding: EdgeInsets.only(bottom: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ml_ic_mediTwo!, height: 75, width: 75, fit: BoxFit.cover).cornerRadiusWithClipRRect(8.0),
          16.height,
          Text(mlLabel_medicine_name!, style: secondaryTextStyle()),
          8.height,
          Text(medicineName!, style: boldTextStyle()),
          16.height,
          Divider(height: 0.5),
          16.height,
          Text(mlLabel_time!, style: boldTextStyle()),
          HorizontalList(
            wrapAlignment: WrapAlignment.spaceEvenly,
            itemCount: time.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(2.0),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorBlue, borderRadius: radius(12.0)),
                child: Text(
                  (time[index]).validate(),
                  style: secondaryTextStyle(color: white),
                ).paddingOnly(left: 8.0, right: 8.0),
              );
            },
          ),
          16.height,
          Text(mlLabel_dosage!, style: boldTextStyle()),
          8.height,
          Text(numberOfTablet!, style: secondaryTextStyle()),
          16.height,
          Text(mlLabel_apply!, style: boldTextStyle()),
          8.height,
          Text(numberOfTime!, style: secondaryTextStyle()),
          16.height,
          Text(mlLabel_duration!, style: boldTextStyle()),
          8.height,
          Text(duration!, style: secondaryTextStyle()),
          16.height,
          Text(mlLabel_process!, style: boldTextStyle()),
          8.height,
          Row(
            children: [
              Text(tabletsTaken!, style: boldTextStyle(size: 12)),
              8.width,
              Container(
                width: context.width() * 0.65,
                child: LinearProgressIndicator(
                  minHeight: 5.0,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  value: 0.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
