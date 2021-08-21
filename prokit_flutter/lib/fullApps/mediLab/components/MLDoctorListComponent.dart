import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLDoctorData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLDoctorDetailScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLCommon.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';

import 'MLScheduleAppointmentComponent.dart';

class MLDoctorListComponent extends StatefulWidget {
  static String tag = '/MLDoctorListComponent';

  @override
  MLDoctorListComponentState createState() => MLDoctorListComponentState();
}

class MLDoctorListComponentState extends State<MLDoctorListComponent> {
  List<MLDoctorData> doctorDataList = mlDoctorListDataList();
  List<String?> time = mlScheduleTimeList();
  int? selectedIndex = 0;
  String? selectedTime;

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
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Doctors', style: boldTextStyle(size: 24)),
                      8.height,
                      Text('Find the service you are', style: secondaryTextStyle()),
                      16.height,
                    ],
                  ).expand(),
                  mlRoundedIconContainer(Icons.search, mlColorBlue),
                  16.width,
                  mlRoundedIconContainer(Icons.calendar_view_day_outlined, mlColorBlue),
                ],
              ),
              8.height,
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 75),
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctorDataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12.0),
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radius(12),
                      border: Border.all(color: selectedIndex == index ? mlColorBlue : mlColorLightGrey100),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 4.0),
                              height: 65,
                              width: 65,
                              decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorCyan, borderRadius: radius(12)),
                              child: Image.asset((doctorDataList[index].image).validate(), fit: BoxFit.fill),
                            ),
                            8.width,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((doctorDataList[index].title).validate(), style: boldTextStyle(size: 18)),
                                8.height,
                                Row(
                                  children: [
                                    Text((doctorDataList[index].subtitle).validate(), style: secondaryTextStyle()),
                                    8.width,
                                    Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text('4.8', style: secondaryTextStyle()),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        16.height,
                        Row(
                          children: [
                            Icon(Icons.watch_later_outlined, color: Colors.grey, size: 16),
                            6.width,
                            Text('next available time : ', style: secondaryTextStyle()),
                            Text('Dec 23 at 8:30 AM', style: boldTextStyle(size: 14, color: Colors.grey.shade700)),
                            8.width,
                          ],
                        ),
                        Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.blue.shade500, borderRadius: radius(20)),
                              child: Text(('\$450'), style: secondaryTextStyle(color: white)).paddingOnly(right: 16.0, left: 16.0),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Doctor\'s Profile ', style: primaryTextStyle(color: mlColorDarkBlue)),
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_forward, color: mlColorDarkBlue, size: 16).paddingLeft(4),
                                  ),
                                ],
                              ),
                            ).onTap(() {
                              MLDoctorDetailScreen().launch(context);
                            })
                          ],
                        ),
                      ],
                    ),
                  ).onTap(() {
                    setState(() {
                      selectedIndex = index;
                    });
                    print('$index');
                  });
                },
              ),
            ],
          ).paddingAll(16.0),
        ),
        Container(
          color: white,
          child: Text(
            'Schedule appointment time',
            style: boldTextStyle(color: mlColorDarkBlue, decoration: TextDecoration.underline),
          ),
        ).paddingOnly(right: 16, bottom: 72).onTap(() {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (builder) {
                return MLScheduleApoointmentSheet();
              });
        }),
      ],
    );
  }
}
