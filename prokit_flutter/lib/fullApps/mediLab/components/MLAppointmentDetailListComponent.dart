import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mediLab/model/MLAppointmentData.dart';
import 'package:prokit_flutter/fullApps/mediLab/screens/MLAppintmentDetailScreen.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLColors.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLDataProvider.dart';
import 'package:prokit_flutter/fullApps/mediLab/utils/MLString.dart';

class MLAppointmentDetailListComponent extends StatefulWidget {
  static String tag = '/MLAppointmentDetailListComponent';

  @override
  MLAppointmentDetailListComponentState createState() => MLAppointmentDetailListComponentState();
}

class MLAppointmentDetailListComponentState extends State<MLAppointmentDetailListComponent> {
  String? time = 'Today, 9:30 PM';
  List<MLAppointmentData> data = mlAppointmentDataList();

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
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Text('October', style: boldTextStyle()),
          16.height,
          Column(
            children: data.map((e) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: Colors.grey.shade50,
                      borderRadius: radius(12),
                    ),
                    child: Column(
                      children: [
                        20.height,
                        Row(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorDarkBlue, borderRadius: radius(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text((e.date).validate(), style: boldTextStyle(size: 32, color: white)),
                                  Text((e.month).validate(), style: secondaryTextStyle(color: white)),
                                ],
                              ),
                            ),
                            8.width,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text((e.department).validate(), style: boldTextStyle(size: 18)),
                                    8.height,
                                    Text((e.doctor).validate(), style: secondaryTextStyle()),
                                    8.height,
                                    Text('Patient: ' + (e.patient).validate(), style: secondaryTextStyle()),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(8.0),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: Colors.transparent,
                                    borderRadius: radius(30),
                                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: e.department == 'General Care' ? mlColorBlue : Colors.grey.shade400,
                                    size: 24,
                                  ),
                                ).paddingBottom(16.0)
                              ],
                            ).expand(),
                          ],
                        ).paddingOnly(right: 16.0, left: 16.0),
                        8.height,
                        Divider(thickness: 0.5),
                        8.height,
                        Row(
                          children: [
                            Text(time!, style: boldTextStyle(color: mlColorDarkBlue)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(mlAppointment_detail!, style: secondaryTextStyle(color: mlColorDarkBlue)),
                                4.width,
                                Icon(Icons.arrow_forward, color: mlPrimaryColor, size: 16),
                              ],
                            ).onTap(() {
                              MLAppointmentDetailScreen().launch(context);
                            }).expand()
                          ],
                        ).paddingOnly(right: 16.0, left: 16.0),
                        16.height,
                      ],
                    ),
                  ).paddingBottom(16.0),
                  Positioned(
                    left: 16.0,
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: mlColorDarkBlue, borderRadius: radius(20)),
                      child: Text((e.service.validate()), style: secondaryTextStyle(color: white)).paddingOnly(right: 10.0, left: 10.0),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
