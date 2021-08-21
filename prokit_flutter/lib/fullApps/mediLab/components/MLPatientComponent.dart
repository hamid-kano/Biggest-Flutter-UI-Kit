import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLPatientData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLAddDependentScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLImage.dart';

class MLPatientComponent extends StatefulWidget {
  static String tag = '/MLPatientComponent';

  @override
  MLPatientComponentState createState() => MLPatientComponentState();
}

class MLPatientComponentState extends State<MLPatientComponent> {
  List<MLPatientData> patientData = mlPatientDataList();
  int? selectedIndex = 0;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Patient', style: boldTextStyle(size: 24)),
          8.height,
          Text('Find the service you are', style: secondaryTextStyle()),
          16.height,
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: patientData.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(12),
                  border: Border.all(color: selectedIndex == index ? mlColorBlue : mlColorLightGrey100),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(ml_ic_profile_picture!).paddingAll(4.0),
                      radius: 32.0,
                      backgroundColor: mlColorCyan,
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((patientData[index].name).validate(), style: boldTextStyle()),
                        4.height,
                        Text((patientData[index].dob).validate(), style: secondaryTextStyle(size: 16)),
                        4.height,
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: Colors.blue.shade500,
                            borderRadius: radius(20),
                          ),
                          child: Text((patientData[index].relation).validate(), style: boldTextStyle(size: 14, color: whiteColor, wordSpacing: 4), textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16.0),
              ).paddingBottom(16.0).onTap(() {
                setState(() {
                  selectedIndex = index;
                  print('$index');
                });
              });
            },
          ),
          Container(
            alignment: Alignment.center,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add New Dependent', style: primaryTextStyle(color: mlColorDarkBlue)),
                8.width,
                Icon(Icons.add_circle_outline, color: mlColorDarkBlue, size: 16),
              ],
            ).paddingAll(16.0).onTap(() {
              MLAddDependentScreen().launch(context);
            }),
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
