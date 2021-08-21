import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';
import 'package:nb_utils/nb_utils.dart';

class MLCreateMedicineComponent extends StatefulWidget {
  static String tag = '/MLCreateMedicineComponent';

  @override
  MLCreateMedicineComponentState createState() => MLCreateMedicineComponentState();
}

class MLCreateMedicineComponentState extends State<MLCreateMedicineComponent> {
  List<String?> medicineImage = <String?>[ml_ic_mediFive, ml_ic_mediTwo, ml_ic_mediThree, ml_ic_mediFour];
  List<String?> time = <String?>['08:30 am', '15:30 am', '20:30 am', ''];
  List<String?> day = <String?>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int? selectedIndex = 0;
  int? selectedDay = 0;

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
      padding: EdgeInsets.only(bottom: 56.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: boldTextStyle()),
              AppTextField(
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: "Placeholder",
                  hintStyle: secondaryTextStyle(size: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mlColorLightGrey),
                  ),
                ),
              ),
              24.height,
              Text('Display Image', style: boldTextStyle()),
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          8.height,
          HorizontalList(
            padding: EdgeInsets.only(left: 16, right: 16),
            wrapAlignment: WrapAlignment.spaceEvenly,
            itemCount: medicineImage.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(color: selectedIndex == index ? Colors.blueAccent : Colors.transparent, width: 2),
                ),
                child: Image.asset((medicineImage[index]).validate(), height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(6.0),
              ).onTap(() {
                setState(() {
                  selectedIndex = index;
                });
              });
            },
          ),
          16.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mlTablet_per_time!, style: boldTextStyle()),
              AppTextField(
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: mlTablet_per_time,
                  hintStyle: secondaryTextStyle(size: 16),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mlColorLightGrey),
                  ),
                ),
              ),
              32.height,
              Text('Time to take the medicine', style: boldTextStyle()),
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          HorizontalList(
            itemCount: time.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(4.0),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorBlue, borderRadius: radius(12)),
                child: Text((time[index]).validate(), style: secondaryTextStyle(color: white)).paddingOnly(left: 8.0, right: 8.0),
              ).paddingLeft(4.0);
            },
          ).paddingOnly(top: 8.0, bottom: 8.0),
          16.height,
          Text('Days of Week', style: boldTextStyle()).paddingLeft(16.0),
          HorizontalList(
            wrapAlignment: WrapAlignment.spaceEvenly,
            itemCount: day.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                padding: EdgeInsets.all(4.0),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: (day[index] == 'Mon' || day[index] == 'Wed' || day[index] == 'Fri') ? Colors.blue.shade400 : Colors.grey.shade400,
                  borderRadius: radius(12),
                  border: Border.all(color: selectedDay == index ? Colors.blueAccent : Colors.transparent, width: 2),
                ),
                child: Text(
                  (day[index]).validate(),
                  style: boldTextStyle(color: white),
                  textAlign: TextAlign.center,
                ),
              ).paddingOnly(left: 4.0, right: 4.0).onTap(() {
                setState(() {
                  selectedDay = index;
                  print(selectedDay);
                });
              });
            },
          ).paddingOnly(top: 8.0, bottom: 8.0),
          16.height,
          Text('Duration', style: boldTextStyle()).paddingLeft(16.0),
          16.height,
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 65,
                height: 65,
                padding: EdgeInsets.all(4.0),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorBlue, borderRadius: radius(12)),
                child: Text('16', style: boldTextStyle(color: white, size: 24), textAlign: TextAlign.center),
              ),
              4.width,
              Text('To', style: boldTextStyle(size: 12)),
              4.width,
              Container(
                width: 65,
                height: 65,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4.0),
                decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.cyan, borderRadius: radius(12)),
                child: Text('30', style: boldTextStyle(color: white, size: 24), textAlign: TextAlign.center),
              ),
            ],
          ).paddingOnly(left: 16.0, bottom: 16),
        ],
      ),
    );
  }
}
